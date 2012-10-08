//
//  CustomAlertView.h
//  AlertViews
//
//  Created by Nery Chapeton-Lamas on 9/21/12.
//  Copyright (c) 2012 Nery Chapeton-Lamas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAlertView : UIAlertView

// contains generated colors from user input as well as default ones needed
// in creation of custom alert view
@property (nonatomic, strong) NSDictionary *colorDictionary;

// method that does the color generations (including the users input colors)
- (void)generateColorsForText:(int)tHex border:(int)bHex background:(int)bgHex hatch:(int)hHex andLinebreak:(int)lHex;

@end
