//
//  ViewController.m
//  Gesture
//
//  Created by Isamu Iida on 2012/10/08.
//  Copyright (c) 2012年 Isamu Iida. All rights reserved.
//
/*	Sample Gesture Project
	Pan, Pinch, Rotate, Tap, Swipe, Long Press
 
Steps:)
	1.	Create a gesture recognizer. When you create a gesture recognizer, you specify a callback method so the gesture recognizer can send you updates when the gesture starts, changes, or ends.
 
	2.	Add the gesture recognizer to a view. Each gesture recognizer is associated with one (and only one) view. When a touch occurs within the bounds of that view, the gesture recognizer will look to see if it matches the type of touch it’s looking for, and if a match is found it will notify the callback method.
	
EX:)	
	1.	Open up MainStoryboard.storyboard, and drag an Image View into the View Controller. Set the image to _____.png, and  resize it.
 
		ex) Pan method
			 ______.h
			 - (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
			 ______.m
			 - (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
			 
				 CGPoint translation = [recognizer translationInView:self.view];
				 recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
				 recognizer.view.center.y + translation.y);
				 [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
	
			 }
 
		MainStoryboard.storyboard - look inside the Object Library for the Pan Gesture Recognizer, and drag it on top of the 
		Image View. This both creates the pan gesture recognizer, and it with the Image View.
 
		Connect the selector for the Pan Geture Recognizers to the View Controller’s handlePan method.  
 
 	2.	Open up the Attributes Inspector, and check the User Interaction Enabled checkbox.
	3.	Compile and run

 
 */

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *singleTabGesture;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *doubleTabGesture;

@end


@implementation ViewController
@synthesize singleTabGesture,doubleTabGesture;

static NSString * const kBTSWiggleTransformAnimation = @"BTSWiggleTransformAnimation";
static NSString * const kBTSWiggleTransformTranslationXAnimation = @"BTSWiggleTransformTranslationXAnimation";

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

-(IBAction)handleSingleTap:(UITapGestureRecognizer *)recognizer {
	
	[UIView animateWithDuration:0.25 animations:^{
        recognizer.view.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        recognizer.view.transform = CGAffineTransformIdentity;
    }];
	////stop wiggling
	[recognizer.view.layer removeAnimationForKey:kBTSWiggleTransformAnimation];
    [recognizer.view.layer removeAnimationForKey:kBTSWiggleTransformTranslationXAnimation];


}

- (IBAction)handleDoubleTap:(UITapGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, 1.5f, 1.5f);
}

- (IBAction)handleSwipeLeft:(UISwipeGestureRecognizer *)recognizer {
	UIViewController *swipe = [self.storyboard instantiateViewControllerWithIdentifier:@"swipeview"];
	[self.navigationController pushViewController:swipe animated:YES];
}
//start wiggling
- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)recognizer {
	// For asthetics... don't reset the animations if we are already "wiggling"... otherwise the layer jerks
    if ([recognizer.view.layer animationForKey:kBTSWiggleTransformAnimation] != nil && [recognizer.view.layer animationForKey:kBTSWiggleTransformTranslationXAnimation] != nil) {
        return;
    }
    
    // NOTE: We need two animations because we need different time scales to achieve the wiggle affect implemented
    //       by this method. The rotation animation happens every 0.1 seconds. The translation animation happens every 0.2 seconds.
    //       This means that we are _not_ able to create a single transformation matrix (rotation and translation) because then we
    //       would be bound to a single time scale.
    
    // Create the rotation animation - a very small angle is all we need to achieve a wiggle effect.
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [rotationAnimation setRepeatCount:MAXFLOAT];
    [rotationAnimation setDuration:0.1];
    [rotationAnimation setAutoreverses:YES];
	
    [rotationAnimation setFromValue:[NSNumber numberWithFloat:(float) (M_PI/100.0)]];
    [rotationAnimation setToValue:[NSNumber numberWithFloat:(float) (-M_PI/100.0)]];
    
    // Create the translation animation along the X axis. This gives is a slight sliding effect, which looks nice.
    CABasicAnimation *translationXAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [translationXAnimation setRepeatCount:MAXFLOAT];
    [translationXAnimation setDuration:0.2];
	
    [translationXAnimation setAutoreverses:YES];
    [translationXAnimation setFromValue:[NSNumber numberWithFloat:[[recognizer view] bounds].origin.x + 2.0]];
    [translationXAnimation setToValue:[NSNumber numberWithFloat:[[recognizer view] bounds].origin.x - 2.0]];
	
    // add the animations using app-specific keys... we use these keys to "stop wiggling".
    [recognizer.view.layer addAnimation:rotationAnimation forKey:kBTSWiggleTransformAnimation];
    [recognizer.view.layer addAnimation:translationXAnimation forKey:kBTSWiggleTransformTranslationXAnimation];
	
}
// This method tells the gesture recognizer whether it is OK to recognize a gesture if another (given) recognizer has already detected a gesture. The default implementation always returns NO
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	//Creates a dependency relationship between the receiver and another gesture recognizer.
	[self.singleTabGesture requireGestureRecognizerToFail:self.doubleTabGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
