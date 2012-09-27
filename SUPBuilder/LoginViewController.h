//
//  ViewController.h
//  SUPScript
//
//  Created by KG on 9/11/12.
//
//

#import <UIKit/UIKit.h>
#import "AppData.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>
{
    AppData *d;
}

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)signInAction:(id)sender;
@end
