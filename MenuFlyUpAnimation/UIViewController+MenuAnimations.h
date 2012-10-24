//
//  UIViewController+MenuAnimations.h
//  MenuAnimation
//
//  Created by Alex Chiu on 10/15/12.
//  Copyright (c) 2012 Alex Chiu. All rights reserved.
//

/* Menu pop up animation
 * To use, import this class to your project
 *   Then it can used by any UIViewController
 */

#import <UIKit/UIKit.h>

@interface UIViewController (MenuAnimations)

-(void)popUpFromBottomWithDuration:(float)duration toHeight:(CGFloat)height withButtons:(UIButton *)btn1, ... NS_REQUIRES_NIL_TERMINATION;

-(void)popUpFromBottomWithDuration:(float)duration toHeight:(CGFloat)height withFlySpace:(CGFloat)flySpace withSpace:(CGFloat)space withButtons:(UIButton *)btn1, ... NS_REQUIRES_NIL_TERMINATION;

@end
