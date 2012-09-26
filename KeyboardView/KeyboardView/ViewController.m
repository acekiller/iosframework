//
//  ViewController.m
//  KeyboardView
//
//  Created by Nery Chapeton-Lamas on 9/14/12.
//  Copyright (c) 2012 Nery Chapeton-Lamas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UITextField *activeTextField;
@property (strong, nonatomic) UITapGestureRecognizer *tap;
@end

@implementation ViewController

@synthesize firstNameTextField;
@synthesize lastNameTextField;
@synthesize street1TextField;
@synthesize street2TextField;
@synthesize cityTextField;
@synthesize stateTextField;
@synthesize zipCodeTextField;
@synthesize emailTextField;
@synthesize phoneTextField;

@synthesize activeTextField;
@synthesize tap;

@synthesize scrollView;

@synthesize inputAccessoryView;


#pragma mark - Input Accessory Methods
// creates toolbar for keyboard for WHENEVER keyboard is displayed!!!
- (UIView *)inputAccessoryView {
    if (!inputAccessoryView) {
        // create background/frame of input accessory view
        CGRect frame = CGRectMake(0, 0, 320, 40);
        
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:frame];
        
        toolBar.barStyle = UIBarStyleBlackTranslucent;
        
        UIBarButtonItem *previousButton = [[UIBarButtonItem alloc] initWithTitle:@"Previous"
                                                                           style:UIBarButtonItemStyleBordered
                                                                          target:self
                                                                          action:@selector(previousTextField)];
        UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                       style:UIBarButtonItemStyleBordered
                                                                      target:self
                                                                      action:@selector(nextTextField)];
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                       target:self action:nil];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleDone
                                                                      target:self
                                                                      action:@selector(dismissKeyboard)];
        toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        toolBar.items =  [NSArray arrayWithObjects:previousButton, nextButton, flexibleSpace, doneButton, nil];
        inputAccessoryView = toolBar;
    }
    return inputAccessoryView;
}


#pragma mark - Helpful (private) methods
// dismiss keyboard by resigning first responder for
// active text field variable we keep through |textFieldDidBeginEditing|
-(void)dismissKeyboard {
    [activeTextField resignFirstResponder];
}
// sets the first responder to be the one after the current |activeTextField|
-(void)nextTextField {
    UITextField *textField = activeTextField;
    
    if ([textField isEqual:firstNameTextField])
        activeTextField = lastNameTextField;
    else if ([textField isEqual:lastNameTextField])
        activeTextField = street1TextField;
    else if ([textField isEqual:street1TextField])
        activeTextField = street2TextField;
    else if ([textField isEqual:street2TextField])
        activeTextField = cityTextField;
    else if ([textField isEqual:cityTextField])
        activeTextField = stateTextField;
    else if ([textField isEqual:stateTextField])
        activeTextField = zipCodeTextField;
    else if ([textField isEqual:zipCodeTextField])
        activeTextField = emailTextField;
    else if ([textField isEqual:emailTextField])
        activeTextField = phoneTextField;
    else if ([textField isEqual:phoneTextField])
        activeTextField = firstNameTextField;
        
    [activeTextField becomeFirstResponder];
}
// sets the first responder to be the one before the current |activeTextField|
-(void)previousTextField {
    UITextField *textField = activeTextField;
    
    if ([textField isEqual:firstNameTextField])
        activeTextField = phoneTextField;
    else if ([textField isEqual:lastNameTextField])
        activeTextField = firstNameTextField;
    else if ([textField isEqual:street1TextField])
        activeTextField = lastNameTextField;
    else if ([textField isEqual:street2TextField])
        activeTextField = street1TextField;
    else if ([textField isEqual:cityTextField])
        activeTextField = street2TextField;
    else if ([textField isEqual:stateTextField])
        activeTextField = cityTextField;
    else if ([textField isEqual:zipCodeTextField])
        activeTextField = stateTextField;
    else if ([textField isEqual:emailTextField])
        activeTextField = zipCodeTextField;
    else if ([textField isEqual:phoneTextField])
        activeTextField = emailTextField;
    
    [activeTextField becomeFirstResponder];
}
// moves the view depending on value of |forTextField|, which
// tells if we're moving the view for a text field (which means
// the view position depends on the current text field) or
// we're simply resetting it to the default position
    // NOTE: device/orientation affects the movement
    // numbers are hardcoded and can be changed depending
    // on your forms, layout, etc.
- (void)moveView:(BOOL)forTextField{
    int pixels;
    
    if (forTextField) {
        int middleOfScreen;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            // ipad detected
            middleOfScreen = 200;
            // numbers may change for portrait/landscape view but
            // as of now it seems this works fine since the ipad
            // has so much screen real estate.
        } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            // iphone detected
            if (self.interfaceOrientation == UIDeviceOrientationPortrait) {
                middleOfScreen = 112; //112 for iphone portrait view
            } else {
                middleOfScreen = 65; // 65 for iphone landscape view
            }
        } else {
            NSLog(@"ERROR");
        }
        
        pixels = activeTextField.frame.origin.y - middleOfScreen;
        int top = 0;
        if (pixels < top) {
            pixels = top;
        }
    } else {
        pixels = 0;
    }
    
    CGPoint point = CGPointMake(0, pixels);
    [scrollView setContentOffset:point animated:YES];    
}

#pragma mark - Keyboard Notification Methods
// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}
// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification {
    [self.view addGestureRecognizer:tap];
}
// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    [self.view removeGestureRecognizer:tap];
    [self moveView:NO];
}

#pragma mark - UITextFieldDelegate Methods
// code executes as soon as return is hit on they keyboard,
// where we simply dismiss the keyboard
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self dismissKeyboard];
    return YES;
}
// code executes as soon as text field has been clicked
    // here we set the private variable |activeTextField|
    // to be the current textField and move the view
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    activeTextField = textField;
    [self moveView:YES];
}
// code executes as soon as text field has finished editing
    // here we set the private variable |activeTextField|
    // to nil since there is no current text field anymore
-(void)textFieldDidEndEditing:(UITextField *)textField {
    activeTextField = nil;
}


#pragma mark - Auto-Generated Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

/* SETTING TEXTFIELD DELEGATES
 * need to set each text fields delegate as |self| so that we can
 * use UITextFieldDelegate methods (like textFieldShouldReturn:).
 */
    firstNameTextField.delegate = self;
    lastNameTextField.delegate = self;
    street1TextField.delegate = self;
    street2TextField.delegate = self;
    cityTextField.delegate = self;
    stateTextField.delegate = self;
    zipCodeTextField.delegate = self;
    emailTextField.delegate = self;
    phoneTextField.delegate = self;
    
/* TAP GESTURE RECOGNIZER
 * need to create tap gesture recognizer and then add it to the view
 * so that we can dismiss the keyboard on tap
 */
    tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
}

// we call the |registerForKeyboardNotification| method here!
-(void)viewWillAppear:(BOOL)animated {
    [self registerForKeyboardNotifications];
}

- (void)viewDidUnload
{
    [self setFirstNameTextField:nil];
    [self setLastNameTextField:nil];
    [self setStreet1TextField:nil];
    [self setStreet2TextField:nil];
    [self setCityTextField:nil];
    [self setStateTextField:nil];
    [self setZipCodeTextField:nil];
    [self setEmailTextField:nil];
    [self setPhoneTextField:nil];
    [self setScrollView:nil];
    [self setInputAccessoryView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
