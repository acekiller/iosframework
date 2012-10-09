//
//  ViewController.h
//  Gesture
//
//  Created by Isamu Iida on 2012/10/08.
//  Copyright (c) 2012年 Isamu Iida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;
- (IBAction)handleSingleTap:(UITapGestureRecognizer *)recognizer;
- (IBAction)handleDoubleTap:(UITapGestureRecognizer *)recognizer;
- (IBAction)handleSwipeLeft:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)recognizer;
@end
