//
//  SUPConnector.m
//  SUPScript
//
//  Created by KG on 9/11/12.
//
//

#import "SUPConnector.h"
#import "SUPApplication.h"
#import "SUPApplicationCallback.h"
#import "SUPRegistrationStatus.h"
#import "SUPSyncStatusInfo.h"
#import "CallbackHandler.h"
#import "SUPEngine.h"
#import "SUPDataVault.h"
#import "SUPConnectionProfile.h"


#define DBClass MedSalesMedSalesDB
#import "MedSalesMedSalesDB.h"
#import "MedSalesLocalKeyGenerator.h"
#define kDataVaultID @"MedSalesDataVaultID"
#define kDataVaultSalt @"MedSalesDataVaultSalt"

#define kErrorBadPin -11111
#define kErrorNoSettings -11112
#define kErrorKeyNotAvailable -11113
#define kErrorFailure -11114

@implementation SUPConnector
@synthesize connectStartTime, callbackHandler, firstrun;
@synthesize noTransportAlert;
@synthesize pin;
@synthesize SUPServerName, SUPServerPort, SUPUserName, SUPConnectionName, SUPPassword, SUPFarmID, SUPActivationCode, SUPManualRegistration;


- (id)init
{
    self = [super init];
    self.noTransportAlert = nil;
    return self;
}

+ (SUPConnector *) instance
{
    static SUPConnector *temp = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{temp = [[self alloc]init];});
    return temp;
}

- (BOOL)testForRequiredSettingsWithServerName:(NSString *)serverName serverPort:(NSString *)serverPort farmID:(NSString *)farmID supUsername:(NSString *)supUsername supPassword:(NSString *)supPassword manualRegistration:(BOOL)manualRegistration connectionName:(NSString *)connectionName activationCode:(NSString *)activationCode
{
    self.SUPServerName = serverName;
    self.SUPServerPort = serverPort;
    self.SUPFarmID = farmID;
    self.SUPUserName = supUsername;
    self.SUPPassword = supPassword;
    self.SUPManualRegistration = manualRegistration;
    self.SUPConnectionName = connectionName;
    self.SUPActivationCode = activationCode;
    self.pin = @"1234";
    
    if(self.SUPServerName == nil || self.SUPUserName == nil || self.SUPFarmID == nil)
    {
        [self showNoTransportAlert:kErrorNoSettings];
        return NO;
    }
    
    if(self.SUPManualRegistration && (self.SUPConnectionName == nil || self.SUPActivationCode == nil))
    {
        [self showNoTransportAlert:kErrorNoSettings];
        return NO;
    }
    
    return YES;
}

- (void)modifyFirstRunValue
{
    self.firstrun = (![MessagingClientLib isMessagingDBExist]);
}

- (void)initializeSUPConnectionWithAppID:(NSString *)appID
{
    // Set log level (optional -- this will generate a lot of output in the debug console)
    [MBOLogger setLogLevel:LOG_DEBUG];
    
    SUPDataVault *vault = nil;
    SUPDataVault *messagingvault = nil;
    
    if(self.firstrun)
    {
        NSLog(@"Running the app for the first time.");
        // If the application is being run for the first time, we do the following:
        //      1. Remove the messaging data vault created by earlier versions of the application, if it exists.
        //      2. Remove the Project data vault created by earlier versions of the application, if it exists.
        //      3. Create the messaging vault using the PIN as the password, leaving it unlocked for use by the messaging layer.
        //      4. Create the Project data vault using the PIN as the password, and store the SUP username/password credentials
        //                  and a database encryption key in the vault.
        //
        @try
        {
            NSLog(@"Delete preexisting messaging vault");
            [SUPDataVault deleteVault:kMessagingDataVaultID];
        }
        @catch(NSException *e)
        {
            // Ignore any exception
        }
        @try {
            NSLog(@"Delete preexisting Project data vault");
            [SUPDataVault deleteVault:kDataVaultID];
        }
        @catch(NSException *e)
        {
            // Ignore any exception
        }
        
        @try {
            NSLog(@"Create new Project data vault and store credentials and a generated encryption key");
            vault = [SUPDataVault createVault:kDataVaultID withPassword:self.pin withSalt:kDataVaultSalt]; // creates the vault
            [vault setString:@"password" withValue:self.SUPPassword];
            [vault lock];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception in creating new Project data vault: %@: %@",[exception name], [exception reason]);
        }
        @try {
            NSLog(@"Create new messaging vault and leave it unlocked");
            messagingvault = [SUPDataVault createVault:kMessagingDataVaultID withPassword:self.pin withSalt:kDVStandardSalt];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception in creating new messaging data vault: %@: %@",[exception name], [exception reason]);
        }
    }
    else
    {
        // If the application has been run before, we get the PIN from the user, and use it to unlock the existing messaging data vault
        // (otherwise the messaging layer cannot start).
        //
        NSLog(@"App has been run before.");
        @try {
            NSLog(@"Unlock messaging vault");
            messagingvault = [SUPDataVault getVault:kMessagingDataVaultID];
            [messagingvault unlock:self.pin withSalt:kDVStandardSalt];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception unlocking messaging data vault: %@: %@",[exception name],[exception reason]);
            [self showNoTransportAlert:kErrorBadPin];
        }
    }
    
    // Start up the messaging client. This will attempt to connect to the server. If a connection was
    // established we can proceed with login. See onConnectFailure: for more information about handling connection failure.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectSuccess:) name:ON_CONNECT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectFailure:) name:ON_CONNECT_FAILURE object:nil];
    self.connectStartTime = [NSDate date];
    SUPApplication* app = [SUPApplication getInstance];
    
    @try {
        vault = [SUPDataVault getVault:kDataVaultID];
        [vault unlock:self.pin withSalt:kDataVaultSalt];
        
        app.applicationIdentifier = appID;
        CallbackHandler *ch = [CallbackHandler getInstance];
        [self setCallbackHandler:ch];
        
        [app setApplicationCallback:[self callbackHandler]];
        
        // Register a callback handler. This should be done before any other SUP code is called.
        // self.callbackHandler = [[CallbackHandler new] autorelease];
        [DBClass registerCallbackHandler:self.callbackHandler];
        
        
        SUPConnectionProperties* props = app.connectionProperties;
        [props setServerName:self.SUPServerName];
        [props setPortNumber:[self.SUPServerPort intValue]];
        [props setUrlSuffix:@""];
        [props setFarmId:self.SUPFarmID];
        
        SUPLoginCredentials* login = [SUPLoginCredentials getInstance];
        if(self.SUPManualRegistration)
        {
            login.username = self.SUPConnectionName;
            login.password = nil;
            props.activationCode = self.SUPActivationCode;
        }
        else
        {
            login.username = self.SUPUserName;
            login.password = [vault getString:@"password"];
            props.activationCode = nil;
        }
        props.loginCredentials = login;
        
        
        
        // Normally you would not delete the local database. For this simple example, though,
        // deleting and creating an empty database will cause all data to be sent from the
        // server, and we can use [CallbackHandler onImportSuccess:] to know when to proceed.
        [DBClass deleteDatabase];
        [DBClass createDatabase];
        SUPConnectionProfile *cp = [DBClass getConnectionProfile];
        [cp.syncProfile setDomainName:@"default"];
        //        [cp.syncProfile setPortNumber:2480];
        [cp enableTrace:NO];
        [cp.syncProfile enableTrace:YES];
        
        // Generate an encryption key for the database.
        [DBClass generateEncryptionKey];
        [DBClass closeConnection];
        // Store the encryption key in the data vault for future use.
        [vault setString:@"encryptionkey" withValue:[cp getEncryptionKey]];
        
        // Since we are creating the database from scratch, we set the encryption key for the new database
        
        // If we were using the database from a previous run of the app and not creating it each time, an application should run the code below instead.
        // To successfully access a previously encrypted database, we set the key used by the connection profile.
        NSString *key = [vault getString:@"encryptionkey"];
        NSLog(@"Got the encryption key: %@",key);
        [cp setEncryptionKey:key];
        [DBClass closeConnection];
        
        [DBClass setApplication:app];
        
        [app registerApplication:30];
        
        while([app registrationStatus] != SUPRegistrationStatus_REGISTERED)
        {
            NSLog(@"waiting for registration...");
            [NSThread sleepForTimeInterval:1.0];
        }
        while([app connectionStatus] != SUPConnectionStatus_CONNECTED)
        {
            NSLog(@"waiting for connection...");
            [NSThread sleepForTimeInterval:1.0];
        }
    }
    @catch (SUPPersistenceException * pe) {
        NSLog(@"%@: %@", [pe name],[pe message]);
        [self showNoTransportAlert:kErrorFailure];
    }
    @finally
    {
        [vault lock];
    }
}


-(void)onConnectSuccess:(NSNotification *)obj
{
    // Connection to the server was made, so log in.
    // See [CallbackHandler onLoginSuccess] and [CallbackHandler onLoginFailure]. One of those
    // callbacks will be called at some point in the future.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ON_CONNECT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ON_CONNECT_FAILURE object:nil];
    NSString *supuser = nil;
    NSString *suppass = nil;
    SUPDataVault *vault = nil;
    @try {
        NSLog(@"Unlock Project vault to get username/password credentials");
        vault = [SUPDataVault getVault:kDataVaultID];
        [vault unlock:self.pin withSalt:kDataVaultSalt];
        supuser = self.SUPUserName;
        suppass = [vault getString:@"password"];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception unlocking messaging data vault: %@: %@",[exception name],[exception reason]);
        [self showNoTransportAlert:kErrorKeyNotAvailable];
    }
    @finally {
        [vault lock];
    }
    
    if(self.firstrun)
    {
        NSLog(@"Running for the first time: check authentication credentials with the server");
        
        // subscribe to database:
        // make sure the databse connection profile has correct username and password
        SUPConnectionProfile *sp = [DBClass getSynchronizationProfile];
        // by default the AsyncReplay is enabled. We will turn it off. This will make the next syncrhonization a blocking call.
        // to make the
        [sp setAsyncReplay:NO];
        [sp setUser:supuser];
        [sp setPassword:suppass];
        [sp setServerName:self.SUPServerName];
        
        @try {
            [DBClass subscribe];
        }
        @catch (NSException *exception) {
            MBOLogError(@"%@: %@", [exception name], [exception reason]);
        }
    }
    else
    {
        NSLog(@"Application was run before -- set authentication credentials, no need to check with server");
        // Set the credentials in the synchronization profile by calling offlineLogin
        
        SUPConnectionProfile *sp = [DBClass getSynchronizationProfile];
        // by default the AsyncReplay is enabled. We will turn it off. This will make the next syncrhonization a blocking call.
        // to make the
        [sp setAsyncReplay:NO];
        [sp setUser:supuser];
        [sp setPassword:suppass];
        [sp setServerName:self.SUPServerName];
        
        @try {
            [DBClass subscribe];
        }
        @catch (NSException *exception) {
            MBOLogError(@"%@: %@", [exception name], [exception reason]);
        }
    }
    
    
    
    @try
    {
        // [SUP101SUP101DB synchronize] will be a blocking call. So using a non blocking call.
        // we cna track the sync status thrgouh onGetSyncStatusChange from SUPSyncStatusListener protocol.
        // this way we are not blocking the UI thread
        [DBClass  synchronizeWithListener:self];
    }
    @catch (NSException *exception) {
        MBOLogError(@"%@: %@", [exception name], [exception reason]);
    }
}

-(void)onConnectFailure:(NSNotification *)obj
{
    // Once [SUPMessageClient start] is called, ON_CONNECT_FAILURE is sent from our callback handler
    // until the device is connected or something changes. If we haven't connected in 30 seconds, give up.
    NSDate *now = [NSDate date];
    if ([now timeIntervalSinceDate:self.connectStartTime] > 30) {
        [SUPApplication stopConnection:30];
        [self showNoTransportAlert:kErrorFailure];
    }
}

- (void)showNoTransportAlert:(NSInteger) ret
{
    NSString *message = nil;
    
    if (ret == kErrorNoSettings) {
        message = @"The connection settings have not been filled in for this application. Go to Settings, enter the connection information, and restart this app.";
    } else if (ret == kErrorKeyNotAvailable) {
        message = @"Unable to access the key.";
    } else if (ret == kErrorBadPin) {
        message = @"Incorrect PIN entered.";
    } else {
        message = @"An error occurred attempting to log in.";
    }
    
    self.noTransportAlert = [[UIAlertView alloc] initWithTitle:@"Unable to start message server" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [self.noTransportAlert performSelectorOnMainThread:@selector(show) withObject:self waitUntilDone:YES];
}

-(void) onGetSyncStatusChange:(SUPSyncStatusInfo*)info
{
    switch(info.state)
    {
        case SYNC_STATE_NONE:
            MBOLogDebug(@"SYNC_STATE_NONE");
            break;
        case SYNC_STATE_STARTING:
            MBOLogDebug(@"SYNC_STATE_STARTING");
            break;
        case SYNC_STATE_CONNECTING:
            MBOLogDebug(@"SYNC_STATE_CONNECTING");
            break;
        case SYNC_STATE_SENDING_HEADER:
            MBOLogDebug(@"SYNC_STATE_SENDING_HEADER");
            break;
        case SYNC_STATE_SENDING_TABLE:
            MBOLogDebug(@"SYNC_STATE_SENDING_TABLE");
            break;
        case SYNC_STATE_SENDING_DATA:
            MBOLogDebug(@"SYNC_STATE_SENDING_DATA");
            break;
        case SYNC_STATE_FINISHING_UPLOAD:
            MBOLogDebug(@"SYNC_STATE_FINISHING_UPLOAD");
            break;
        case SYNC_STATE_RECEIVING_UPLOAD_ACK:
            MBOLogDebug(@"SYNC_STATE_RECEIVING_UPLOAD_ACK");
            break;
        case SYNC_STATE_RECEIVING_TABLE:
            MBOLogDebug(@"SYNC_STATE_RECEIVING_TABLE");
            break;
        case SYNC_STATE_RECEIVING_DATA:
            MBOLogDebug(@"SYNC_STATE_RECEIVING_DATA");
            break;
        case SYNC_STATE_COMMITTING_DOWNLOAD:
            MBOLogDebug(@"SYNC_STATE_COMMITTING_DOWNLOAD");
            break;
        case SYNC_STATE_SENDING_DOWNLOAD_ACK:
            MBOLogDebug(@"SYNC_STATE_SENDING_DOWNLOAD_ACK");
            break;
        case SYNC_STATE_DISCONNECTING:
            MBOLogDebug(@"SYNC_STATE_DISCONNECTING");
            break;
        case SYNC_STATE_DONE:
        {
            MBOLogDebug(@"SYNC_STATE_DONE");
            NSNotification *notification = [NSNotification notificationWithName:ON_CONNECT_DONE object:nil];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
            break;
        }
        case SYNC_STATE_ERROR:
            MBOLogDebug(@"SYNC_STATE_ERROR");
            break;
        case SYNC_STATE_ROLLING_BACK_DOWNLOAD:
            MBOLogDebug(@"SYNC_STATE_ROLLING_BACK_DOWNLOAD");
            break;
        case SYNC_STATE_UNKNOWN:
            MBOLogDebug(@"SYNC_STATE_UNKNOWN");
            break;
        default:
            MBOLogDebug(@"DEFAULT");
            break;
    }
}


@end
