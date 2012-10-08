//
//  ViewController.h
//  AlertViews
//
//  Created by Nery Chapeton-Lamas on 9/21/12.
//  Copyright (c) 2012 Nery Chapeton-Lamas. All rights reserved.
//

// used following tutorials:
    // http://mobile.tutsplus.com/tutorials/iphone/uialertview/
    // http://mobile.tutsplus.com/tutorials/iphone/ios-sdk-uialertview-custom-graphics/

#import <UIKit/UIKit.h>
#import "CustomAlertView.h" // need to import this to use custom alert

// ViewController is now a UIAlertViewDelegate
// need that added to use delegate methods
@interface ViewController : UIViewController <UIAlertViewDelegate>

/*** button methods ***/
- (IBAction)defaultSimpleAlertButton:(UIButton *)sender;
- (IBAction)simpleAlertButton:(UIButton *)sender;

- (IBAction)defaultNormalAlertButton:(UIButton *)sender;
- (IBAction)normalAlertButton:(UIButton *)sender;

- (IBAction)defaultButtonsAlertButton:(UIButton *)sender;
- (IBAction)buttonsAlertButton:(UIButton *)sender;
@end
