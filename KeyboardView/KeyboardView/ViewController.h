//
//  ViewController.h
//  KeyboardView
//
//  Created by Nery Chapeton-Lamas on 9/14/12.
//  Copyright (c) 2012 Nery Chapeton-Lamas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UITextFieldDelegate>

/***** Text Fields for our view *****/
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *street1TextField;
@property (weak, nonatomic) IBOutlet UITextField *street2TextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

/***** Scroll view that contains all our content in storyboard *****/
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

/***** Input Accessory View required for toolbar above keyboard *****/
@property (strong, nonatomic) UIView *inputAccessoryView;


@end
