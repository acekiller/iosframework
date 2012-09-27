//
//  SUPConnector.h
//  SUPScript
//
//  Created by KG on 9/11/12.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CallbackHandler.h"
#import "SUPSyncStatusListener.h"

@interface SUPConnector : NSObject <SUPSyncStatusListener>


@property (nonatomic, retain) NSDate *connectStartTime;
@property (nonatomic, retain) CallbackHandler *callbackHandler;

@property (nonatomic, assign) BOOL firstrun;
@property (nonatomic, retain) UIAlertView *noTransportAlert;

@property (nonatomic, retain) NSString *pin;

@property (nonatomic, retain) NSString *SUPServerName;
@property (nonatomic, retain) NSString *SUPServerPort;
@property (nonatomic, retain) NSString *SUPFarmID;
@property (nonatomic, retain) NSString *SUPUserName;
@property (nonatomic, retain) NSString *SUPPassword;
@property (nonatomic, retain) NSString *SUPConnectionName;
@property (nonatomic, retain) NSString *SUPActivationCode;
@property (nonatomic, assign) BOOL SUPManualRegistration;

+ (SUPConnector *) instance;
- (BOOL)testForRequiredSettingsWithServerName:(NSString *)serverName serverPort:(NSString *)serverPort farmID:(NSString *)farmID supUsername:(NSString *)supUsername supPassword:(NSString *)supPassword manualRegistration:(BOOL)manualRegistration connectionName:(NSString *)connectionName activationCode:(NSString *)activationCode;
- (void)modifyFirstRunValue;
- (void)initializeSUPConnectionWithAppID:(NSString *)appID;

@end