//
//  ViewController.m
//  SUPScript
//
//  Created by KG on 9/11/12.
//
/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////////////////////////////////////////////////
//
// INSTRUCTIONS
// 1. copy paste "iOS" folder
// 2. add the 7 SUP frameworks and other frameworks
// 3. import "SUPConnector", "CallbackHandler", and "MySyncStatusListner"
// 4. enter "$(SRCROOT)/$(PRODUCT_NAME)/iOS/RBS/includes/**" for header search paths
// 5. enter "$(SRCROOT)/$(PRODUCT_NAME)/iOS/RBS/Libraries/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)/**" for library search paths
// 6. compile sources -> all generated code files and CallbackHandler "-fno-objc-arc"
// 7. change the project name in "SUPConnector.m"
//


#import "ViewController.h"
#import "SUPConnector.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([[SUPConnector instance] testForRequiredSettingsWithServerName:@"68.225.30.194" serverPort:@"5001" farmID:@"0" supUsername:@"test" supPassword:@"test" manualRegistration:YES connectionName:@"scriptTest" activationCode:@"123"]);
    {
        [[SUPConnector instance] modifyFirstRunValue];
        [[SUPConnector instance] initializeSUPConnectionWithAppID:@"MedSales"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectDone:) name:ON_CONNECT_DONE object:nil];
    }
}

-(void)onConnectDone:(NSNotification *)obj
{
    NSLog(@"DONE");
    // CONTINUE WITH YOUR APP
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
