//
//  UIViewController+MenuAnimations.m
//  MenuAnimation
//
//  Created by Alex Chiu on 10/15/12.
//  Copyright (c) 2012 Alex Chiu. All rights reserved.
//

#import "UIViewController+MenuAnimations.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewController (MenuAnimations)

-(void)popUpFromBottomWithDuration:(float)duration toHeight:(CGFloat)height withButtons:(UIButton *)btn1, ...
{
    va_list args;
    va_start(args, btn1);
    
    [self popUpFromBottomWithDuration:duration toHeight:height withFlySpace:230 withSpace:20 withButton:btn1 andList:args];
}

-(void)popUpFromBottomWithDuration:(float)duration toHeight:(CGFloat)height withFlySpace:(CGFloat)flySpace withSpace:(CGFloat)space withButtons:(UIButton *)btn1, ...
{
    va_list args;
    va_start(args, btn1);
    
    [self popUpFromBottomWithDuration:duration toHeight:height withFlySpace:flySpace withSpace:space withButton:btn1 andList:args];
}

//Main animation function used in overloading (PRIVATE)
-(void)popUpFromBottomWithDuration:(float)duration toHeight:(CGFloat)height withFlySpace:(CGFloat)flySpace withSpace:(CGFloat)space withButton:(UIButton *)btn1 andList:(va_list)args
{
    float _space = space;   //Space between the buttoms
    float _flySpace = flySpace;   //Space between them flying up
    float screenXCenter = [[UIScreen mainScreen] applicationFrame].size.width/2;
    float screenYMax = [[UIScreen mainScreen] applicationFrame].size.height;
    
    //Holds the final frame positions of the buttons
    NSMutableArray *finalFrames = [[NSMutableArray alloc] init];
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    float y = height;
    
    int i=0; //Counter for multiplying flyspace
    
    va_list btns = args;
    for(UIButton *btnI = btn1; btnI != nil; btnI = va_arg(btns, UIButton*))
    {
        NSLog(@"%@", btnI);
        [btnI setCenter:CGPointMake(screenXCenter, screenYMax + (++i * _flySpace))];
        
        [buttons addObject:btnI];  //Adding buttons to an array to prevent using va_list again
        
        //Setting the ending position of the btnI
        float x = screenXCenter - (btnI.frame.size.width/2);
        CGRect frame = CGRectMake(x, y, btnI.frame.size.width, btnI.frame.size.height);
        [finalFrames addObject:[NSValue valueWithCGRect:frame]];
        
        y += btnI.frame.size.height + _space; //Setting the y of the next button
    }
    va_end(btns);
    
    //Animations happens here
    //Buttons already spawned off the button of the screen will move up to the position of the first button
    //Then they will drop to their position
    [UIView animateWithDuration:duration/2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //Moving all the buttons to one single location
        //Dropping down is in the completion section
        for(int j=0; j<[buttons count]; j++)
        {
            UIButton *btnI = [buttons objectAtIndex:j];
            float topPositionY=height, topPositionX;
            topPositionX = screenXCenter - (btnI.frame.size.width/2);
            [btnI setFrame:CGRectMake(topPositionX, topPositionY, btnI.frame.size.width, btnI.frame.size.height)];
        }
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration/2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //Drops down the buttons from the location of the first button
            for(int j=0; j<[buttons count]; j++)
            {
                UIButton *btnI = [buttons objectAtIndex:j];
                [btnI setFrame:[[finalFrames objectAtIndex:j] CGRectValue]];
            }
        } completion:^(BOOL finished){
            //Nothing happens here
        }];
    }];
}

@end
