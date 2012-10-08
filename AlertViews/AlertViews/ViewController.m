//
//  ViewController.m
//  AlertViews
//
//  Created by Nery Chapeton-Lamas on 9/21/12.
//  Copyright (c) 2012 Nery Chapeton-Lamas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - UIAlertView IBAction Methods
// default alert view 
- (IBAction)defaultSimpleAlertButton:(UIButton *)sender {
    //Strings for alert message/buttons
    NSString *myMessage = @"This is a simple alert view message! Booooooriiinggg";
    NSString *cancelButton =@"Cancel";
    //create alert view object
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:myMessage
                                                           delegate:self
                                                  cancelButtonTitle:cancelButton
                                                  otherButtonTitles:nil];
    // set tag in case you have multiple alerts and want to change
    // functionality based on which alert is displayed (not just which button
    [alert setTag:1];
    // display alert to user
    [alert show];
}
// default alert view with title, messasge, and cancel button
- (IBAction)defaultNormalAlertButton:(UIButton *)sender {
    //Strings for alert message/buttons
    NSString *myTitle = @"Title";
    NSString *myMessage = @"Same as Simple alert but with title! Bleeeehhh";
    NSString *cancelButton =@"Cancel";
    //create alert view object
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:myTitle
                                                            message:myMessage
                                                           delegate:self
                                                  cancelButtonTitle:cancelButton
                                                  otherButtonTitles:nil];
    // set tag in case you have multiple alerts and want to change
    // functionality based on which alert is displayed (not just which button
    [alert setTag:2];
    // display alert to user
    [alert show];
}
// default alert view with title, message, and multiple buttons
- (IBAction)defaultButtonsAlertButton:(UIButton *)sender {
    //Strings for alert message/buttons
    NSString *myTitle = @"Lots o' Buttons";
    NSString *myMessage = @"This one just has lots of buttons, meeehhh :P";
    NSString *cancelButton =@"Cancel";
    NSString *button1 = @"Button 1";
    NSString *button2 = @"Button 2";
    NSString *button3 = @"Button 3";
    //create alert view object
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:myTitle
                                                            message:myMessage
                                                           delegate:self
                                                  cancelButtonTitle:cancelButton
                                                  otherButtonTitles:button1,button2,button3,nil];
    
    //SIDE NOTE:
    // can also add buttons programmatically in case you want to choose which buttons
    // to add depending on some conditions (put the |addButtonWithTitle| in an if statement!)
    /*CustomAlertView *alert = [[CustomAlertView alloc] initWithTitle:myTitle
     message:myMessage
     delegate:nil
     cancelButtonTitle:cancelButton
     otherButtonTitles:nil];
     [alert addButtonWithTitle:button1];
     [alert addButtonWithTitle:button2];
     [alert addButtonWithTitle:button3];*/
    
    // set tag in case you have multiple alerts and want to change
    // functionality based on which alert is displayed (not just which button
    [alert setTag:3];
    // display alert to user
    [alert show];
}

#pragma mark - CustomAlertView IBAction Methods
// simple alert only displays message and cancel button, good for
// confirmation message ("finished submiting form!", etc.)
- (IBAction)simpleAlertButton:(UIButton *)sender {
    //Strings for alert message/buttons
    NSString *myMessage = @"This is the default color scheme for CustomAlertView! Pretty nice right?";
    NSString *cancelButton =@"Sure";
    //create alert view object
    CustomAlertView *alert = [[CustomAlertView alloc] initWithTitle:nil
                                                    message:myMessage
                                                   delegate:self
                                          cancelButtonTitle:cancelButton
                                          otherButtonTitles:nil];
    // set tag in case you have multiple alerts and want to change
    // functionality based on which alert is displayed (not just which button
    [alert setTag:10];
    // display alert to user
    [alert show];
}
// normal alert displays title, message, and cancel button
// like simple alert but has title
- (IBAction)normalAlertButton:(UIButton *)sender {
    //Strings for alert message/buttons
    NSString *myTitle = @"Inverted";
    NSString *myMessage = @"This color scheme is pretty much the opposite of the one above! Cool huh?!";
    NSString *cancelButton =@"Maybe";
    //create alert view object
    CustomAlertView *alert = [[CustomAlertView alloc] initWithTitle:myTitle
                                                      message:myMessage
                                                     delegate:self
                                            cancelButtonTitle:cancelButton
                                            otherButtonTitles:nil];
    // set tag in case you have multiple alerts and want to change
    // functionality based on which alert is displayed (not just which button
    [alert setTag:20];
    // call this method before you display alert to customize colors
    [alert generateColorsForText:0xFFFFFF border:0xFFFFFF background:0x000000 hatch:0xD2D2D2 andLinebreak:0xD2D2D2];
    // display alert to user
    [alert show];
}
// buttons alert displays normal alert but with multiple button
// this example has 3 buttons but can add as many as are needed
// NOTE: if only one other button is added (not including cancel button)
// then the buttons are displayed next to each other. This is good for
// a Yes/No, OK/Cancel scenario.  Otherwise, it lists them horizontally
// going down (all |otherButtonTitles| first, followed by the cancel button)
- (IBAction)buttonsAlertButton:(UIButton *)sender {
    //Strings for alert message/buttons
    NSString *myTitle = @"Super Custom";
    NSString *myMessage = @"Alright this one is super customized. Crazy colors and lots of buttons! Awesome right?!?!";
    NSString *cancelButton =@"YES! :O!";
    NSString *button1 = @"Button 1";
    NSString *button2 = @"Button 2";
    NSString *button3 = @"Button 3";
    //create alert view object
    CustomAlertView *alert = [[CustomAlertView alloc] initWithTitle:myTitle
                                                    message:myMessage
                                                   delegate:self
                                          cancelButtonTitle:cancelButton
                                          otherButtonTitles:button1,button2,button3,nil];
    
    //SIDE NOTE:
    // can also add buttons programmatically in case you want to choose which buttons
    // to add depending on some conditions (put the |addButtonWithTitle| in an if statement!)
    /*CustomAlertView *alert = [[CustomAlertView alloc] initWithTitle:myTitle
                                                    message:myMessage
                                                   delegate:nil
                                          cancelButtonTitle:cancelButton
                                          otherButtonTitles:nil];
    [alert addButtonWithTitle:button1];
    [alert addButtonWithTitle:button2];
    [alert addButtonWithTitle:button3];*/
    
    // set tag in case you have multiple alerts and want to change
    // functionality based on which alert is displayed (not just which button
    [alert setTag:30];
    // call this method before you display alert to customize colors
    [alert generateColorsForText:0xD9CCB9 border:0xDF7782 background:0x017890 hatch:0xE95D22 andLinebreak:0xE95D22];
    // display alert to user
    [alert show];
}

#pragma mark - UIAlertViewDelegate Methods
// in this method can execute code depending which button is tapped,
// even which alert view is called, and combinations thereof!
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // can detect which button was clicked by the button index
        // note: 0 = cancel button, 1 = first button, 2 = second button, etc.
    if(buttonIndex == 0) {
        NSLog(@"tapped OK/CANCEL!");
    } else if(buttonIndex == 1) {
        NSLog(@"tapped BUTTON 1!");
    } else if (buttonIndex == 2) {
        NSLog(@"tapped BUTTON 2!");
    } else if (buttonIndex == 3) {
        NSLog(@"tapped BUTTON 3!");
    }
    /*
    // can also detect which button based on title of the button
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"OK"]) {
        // first two alert views use OK instead of Cancel
        NSLog(@"tapped OK!");
    } else if ([title isEqualToString:@"Cancel"]) {
        NSLog(@"tapped CANCEL!");
    } else if ([title isEqualToString:@"Button 1"]) {
        NSLog(@"tapped BUTTON 1!");
    } else if ([title isEqualToString:@"Button 2"]) {
        NSLog(@"tapped BUTTON 2!");
    } else if ([title isEqualToString:@"Button 3"]) {
        NSLog(@"tapped BUTTON 3!");
    }*/
    
    /*
    // can also differentiate between alert views if you set the tag!!
    NSInteger tag = [alertView tag];
    if (tag == 10) {
        NSLog(@"inside simple alert!");
    } else if (tag == 20) {
        NSLog(@"inside normal alert!");
    } else if (tag == 30) {
        NSLog(@"inside alert with buttons!");
    }
    */

}
// rest of delegate methods displayed here with no functionality, but could be useful
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
}
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
}
- (void)alertViewCancel:(UIAlertView *)alertView {
}


#pragma mark - Generated Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
