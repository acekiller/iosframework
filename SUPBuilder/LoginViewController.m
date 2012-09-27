//
//  LoginViewController.m
//  SUPScript
//
//  Created by KG on 9/11/12.
//  Modified by afurusawa on 9/27/12
/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////////////////////////////////////////////////
//
// INSTRUCTIONS
// 1. copy paste "iOS" folder
// 2. add the 7 SUP frameworks and other frameworks
// 3. import "SUPConnector", "CallbackHandler", and "MySyncStatusListner"
// 4. enter "$(SRCROOT)/$(PRODUCT_NAME)/iOS/RBS/includes/**" for header search paths
// 5. enter "$(SRCROOT)/$(PRODUCT_NAME)/iOS/RBS/Libraries/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)" for library search paths
// 6. compile sources -> all generated code files and CallbackHandler "-fno-objc-arc"
// 7. change the project name in "SUPConnector.m"
//


#import "LoginViewController.h"
#import "SUPConnector.h"
#import "AppData.h"
#import "RapidToast.h"

// SUP CONNECTION CONFIGURATIONS
#define APP_ID @""
#define SERVER_NAME @"68.225.30.194"
#define SERVER_PORT @"5002"
#define FARM_ID @"0"
#define SUP_USERNAME @"user"
#define SUP_PASSWORD @"User1"
#define ACTIVATION_CODE @"123"

// SUP ALERT VIEW CONTENT
#define ALERT_TITLE @"Welcome"
#define ALERT_MSG @"In order to securely access your SAP data from your iOS device, contact us to setup your backend connection to SAP or any other data source. For more information, email us at: info@rapidconsultingusa.com"
#define DEMO_BUTTON 0
#define SUP_BUTTON 1

@interface LoginViewController ()
{
    //RapidToast *toast;
    BOOL revisit;
}

@end

@implementation LoginViewController
@synthesize usernameTextField, passwordTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    d = [AppData sharedInstance];
    [self.navigationController setNavigationBarHidden:YES];
    
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:ALERT_TITLE message:ALERT_MSG delegate:self cancelButtonTitle:@"Demo application" otherButtonTitles:@"Sign in using SUP", nil];
    [message setAlertViewStyle:UIAlertViewStyleDefault];
    [message show];
  
}

- (void)viewDidAppear:(BOOL)animated
{
    if (revisit) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:ALERT_TITLE message:ALERT_MSG delegate:self cancelButtonTitle:@"Demo application" otherButtonTitles:@"Sign in using SUP", nil];
        [message setAlertViewStyle:UIAlertViewStyleDefault];
        [message show];
    }
}

- (void)viewDidUnload
{
    [self setPasswordTextField:nil];
    [self setUsernameTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)connectToSUP
{
    // Connect to SUP
    if ([[SUPConnector instance] testForRequiredSettingsWithServerName:SERVER_NAME serverPort:SERVER_PORT farmID:FARM_ID supUsername:SUP_USERNAME supPassword:SUP_PASSWORD manualRegistration:YES connectionName:@"scriptTest" activationCode:ACTIVATION_CODE]) {
        
        [[SUPConnector instance] modifyFirstRunValue];
        [[SUPConnector instance] initializeSUPConnectionWithAppID:APP_ID];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectDone:) name:ON_CONNECT_DONE object:nil];
    }
}
- (void)onConnectDone:(NSNotification *)obj
{
    NSLog(@"DONE");
    // CONTINUE WITH YOUR APP    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/****************************************************************************************************
 Alert View - clicked button
 ****************************************************************************************************/
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // left button is demo
    if (buttonIndex == DEMO_BUTTON) {
        [d setIsSUPConnection:NO];
    }
    
    // right button is sup
    else if (buttonIndex == SUP_BUTTON) {
        if (!d.isSUPConnection) {
            [self connectToSUP];
        }
        [d setIsSUPConnection:YES];
    }
}



/****************************************************************************************************
 Sign in button pressed
 ****************************************************************************************************/
- (IBAction)signInAction:(id)sender {
    
    d.username = usernameTextField.text; //store current employee id.
    
    /**********************/
    /*   SUP Connection   */
    /**********************/
    if (d.isSUPConnection) {
//        
//        SUPUsers = [HR_SuiteUsers findAll]; //load from SUP.
//        
//        if ([SUPUsers length] > 0)
//        {
//            usernameAndPasswordIsCorrect = NO;
//            for (HR_SuiteUsers *supItem in SUPUsers)
//            {
//                
//                if([supItem.employeeID isEqualToString:usernameField.text] && [supItem.employeePassword isEqualToString:passwordField.text]) {
//                    NSLog(@"\n username=%@ \n password=%@", supItem.employeeID, supItem.employeePassword);
//                    NSLog(@"Login was successful.");
//                    
//                    usernameAndPasswordIsCorrect = YES;
//                    incorrectLoginLabel.hidden = YES;
//                    [self performSegueWithIdentifier: @"toMain" sender: self];
//                }
//            }
//            
//            //If the username and/or password is wrong, set error condition.
//            if (!usernameAndPasswordIsCorrect) {
//                NSLog(@"Incorrect username and/or password");
//                incorrectLoginLabel.hidden = NO;
//                passwordField.text = nil;
//            }
//        }
    }
    
    /************/
    /*   DEMO   */
    /************/
    else {
        
        if (([usernameTextField.text isEqualToString:@"manager"] || [usernameTextField.text isEqualToString:@"user"]) && [passwordTextField.text isEqualToString:@"test"]) {
            [self performSegueWithIdentifier: @"toMain" sender: self];
        }
        
        else {
            usernameTextField.text = nil;
            passwordTextField.text = nil;
            [RapidToast toastWithMessage:@"Sign-in Failed" withBackgroundColor:[UIColor redColor] andTextColor:[UIColor whiteColor] forView:self.view];
        }
    }    
    revisit = YES;
}



@end
