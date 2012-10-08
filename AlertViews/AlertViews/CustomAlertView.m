//
//  CustomAlertView.m
//  AlertViews
//
//  Created by Nery Chapeton-Lamas on 9/21/12.
//  Copyright (c) 2012 Nery Chapeton-Lamas. All rights reserved.
//

#import "CustomAlertView.h"


@implementation CustomAlertView

@synthesize colorDictionary;

// method takes in users hex color input and generates colors for all parts of alert view
// returns nothing, but sets colorDictionary to result of all calculations!
// NOTE: method inputs are enough to customize alert view, but if you really want to tweak
// things you should do it in this method if you just want to change the colors/opacity/etc.
- (void)generateColorsForText:(int)tHex border:(int)bHex background:(int)bgHex hatch:(int)hHex andLinebreak:(int)lHex {
    // convert hex to colors
    UIColor *textColor = [UIColor colorWithRed:((float)((tHex & 0xFF0000) >> 16))/255.0 green:((float)((tHex & 0x00FF00) >> 8))/255.0 blue:((float)(tHex & 0x0000FF))/255.0 alpha:1.0];
    UIColor *borderColor = [UIColor colorWithRed:((float)((bHex & 0xFF0000) >> 16))/255.0 green:((float)((bHex & 0x00FF00) >> 8))/255.0 blue:((float)(bHex & 0x0000FF))/255.0 alpha:1.0];
    UIColor *backgroundColor = [UIColor colorWithRed:((float)((bgHex & 0xFF0000) >> 16))/255.0 green:((float)((bgHex & 0x00FF00) >> 8))/255.0 blue:((float)(bgHex & 0x0000FF))/255.0 alpha:1.0];
    UIColor *hatchColor = [UIColor colorWithRed:((float)((hHex & 0xFF0000) >> 16))/255.0 green:((float)((hHex & 0x00FF00) >> 8))/255.0 blue:((float)(hHex & 0x0000FF))/255.0 alpha:1.0];
    UIColor *linebreakColor = [UIColor colorWithRed:((float)((lHex & 0xFF0000) >> 16))/255.0 green:((float)((lHex & 0x00FF00) >> 8))/255.0 blue:((float)(lHex & 0x0000FF))/255.0 alpha:1.0];

    // colors that are constant, not based on user input
    UIColor *blackColor = [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
    UIColor *whiteColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    UIColor *labelShadowColor = blackColor;
    UIColor *alertRectShadowColor = blackColor;
    UIColor *alertInnerShadowColor = blackColor;
    UIColor *linebreakShadowColor = whiteColor;//[whiteColor colorWithAlphaComponent:0.2f];
    UIColor *alertRedrawShadowColor = [blackColor colorWithAlphaComponent:0.1f];

    // generate colors for each part of alert view based on user input colors
    UIColor *labelTextColor = textColor;
    UIColor *alertRectFillColor = borderColor;
    UIColor *gradientColor = backgroundColor;
    UIColor *hatchStrokeColor = [hatchColor colorWithAlphaComponent:0.15f];
    UIColor *linebreakStrokeColor = [linebreakColor colorWithAlphaComponent:0.6f];
    UIColor *alertInnerStrokeColor = backgroundColor;
    UIColor *alertRedrawStrokeColor = borderColor;
    
    // generate dictionary of custom alert view colors
    NSArray *colorKeys = [[NSArray alloc] initWithObjects:@"labelTextColor",@"labelShadowColor",
                          @"alertRectFillColor",@"alertRectShadowColor",
                          @"gradientColor",@"hatchStrokeColor",
                          @"linebreakStrokeColor",@"linebreakShadowColor",
                          @"alertInnerStrokeColor",@"alertInnerShadowColor",
                          @"alertRedrawStrokeColor",@"alertRedrawShadowColor",nil];
    NSArray *colorValues = [[NSArray alloc] initWithObjects:labelTextColor,labelShadowColor,
                          alertRectFillColor,alertRectShadowColor,
                          gradientColor,hatchStrokeColor,
                          linebreakStrokeColor,linebreakShadowColor,
                          alertInnerStrokeColor,alertInnerShadowColor,
                          alertRedrawStrokeColor,alertRedrawShadowColor,nil];
    NSDictionary *customAlertColors = [[NSDictionary alloc] initWithObjects:colorValues forKeys:colorKeys];
    
    colorDictionary = customAlertColors;
}

- (void)layoutSubviews
{    
    for (UIView *subview in self.subviews){ //Fast Enumeration
        if ([subview isMemberOfClass:[UIImageView class]]) {
            subview.hidden = YES; //Hide UIImageView Containing Blue Background
        }
        if ([subview isMemberOfClass:[UILabel class]]) { //Point to UILabels To Change Text
            UILabel *label = (UILabel*)subview; //Cast From UIView to UILabel
            UIColor *labelTextColor = [colorDictionary objectForKey:@"labelTextColor"];
            label.textColor = labelTextColor;
            UIColor *labelShadowColor = [colorDictionary objectForKey:@"labelShadowColor"];
            label.shadowColor = labelShadowColor;
            label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        }
    }
}

#pragma mark - Xcode Generated Methods (Customized)
// Overrode drawRect method to do all our sexy custom stuff.
// NOTE: if you want to mess with the colors, you should do it in the first method in this class,
// otherwise messing with the code in this method is for customizing how things are drawn.
// CAREFUL!!! Very long and tricky code, but most likely change could be changing the hatched background
// to some other time (checkered perhaps?).  Make sure you know what you're doing!!!
- (void)drawRect:(CGRect)rect
{    
    CGContextRef context = UIGraphicsGetCurrentContext(); //current views graphics context
    
    // create base shape
    CGRect activeBounds = self.bounds; //use alert views to redraw custom alert view
    CGFloat cornerRadius = 10.0f; //roundness of corners
    CGFloat inset = 6.5f; // how far inside the bounds the shape is drawn
    CGFloat originX = activeBounds.origin.x + inset;
    CGFloat originY = activeBounds.origin.y + inset;
    CGFloat width = activeBounds.size.width - (inset*2.0f);
    CGFloat height = activeBounds.size.height - (inset*2.0f);
    CGRect bPathFrame = CGRectMake(originX, originY, width, height);
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:bPathFrame cornerRadius:cornerRadius].CGPath;
    
    // add a fill and outer drop shadow
    CGContextAddPath(context, path);
    UIColor *alertRectFillColor = [colorDictionary objectForKey:@"alertRectFillColor"];
    CGContextSetFillColorWithColor(context, alertRectFillColor.CGColor);
    UIColor *alertRectShadowColor = [colorDictionary objectForKey:@"alertRectShadowColor"];
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 6.0f, alertRectShadowColor.CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    // clip the context
    CGContextSaveGState(context); //Save Context State Before Clipping To "path"
    CGContextAddPath(context, path);
    CGContextClip(context);
    
    // draw a gradient
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t count = 3;
    CGFloat locations[3] = {0.0f, 0.57f, 1.0f};
    UIColor *gradientColor = [colorDictionary objectForKey:@"gradientColor"];
    const CGFloat *gColor1 = CGColorGetComponents(gradientColor.CGColor); // each component is 0 to 1 float (not out of 255)
    CGFloat components[12] =
    {
        gColor1[0]/3.0, gColor1[1]/3.0, gColor1[2]/3.0, 1.0f,     //1
        gColor1[0]/3.8, gColor1[1]/3.8, gColor1[2]/3.8, 1.0f,     //2
        gColor1[0]/5.25, gColor1[1]/5.25, gColor1[2]/5.25, 1.0f,     //3
    };
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, count);
    CGPoint startPoint = CGPointMake(activeBounds.size.width * 0.5f, 0.0f);
    CGPoint endPoint = CGPointMake(activeBounds.size.width * 0.5f, activeBounds.size.height);
    // draw gradient withing bounds of alert view (|startPoint| and |endPoint|)
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    // release objects now that we're done with them
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    
    // calculate label heights to correctly offset button hatched background
    CGFloat labelsHeightTotal = 0;
    int labelCount = 0;
    for (UIView *subview in self.subviews){ //Fast Enumeration
        if ([subview isMemberOfClass:[UILabel class]]) { //Point to UILabels to get each height
            UILabel *label = (UILabel*)subview; //Cast From UIView to UILabel
            labelCount++;
            if (labelCount == 1) {
                labelsHeightTotal += label.bounds.size.height + 20;
            } else { //labelCount == 2
                labelsHeightTotal += label.bounds.size.height + 10;
            }
        }
    }
    
    // create a hatched background
    CGFloat buttonOffset = labelsHeightTotal; //Offset buttonOffset by half point for crisp lines (height of space for hatched lines to start being drawn)
    CGContextSaveGState(context); //Save Context State Before Clipping "hatchPath"
    CGRect hatchFrame = CGRectMake(0.0f, buttonOffset, activeBounds.size.width, (activeBounds.size.height - buttonOffset+1.0f)); //only want to draw hatched background on area with buttons
    CGContextClipToRect(context, hatchFrame); //clip context to the buttons area
    CGFloat spacer = 4.0f; //space between lines?
    int rows = (activeBounds.size.width + activeBounds.size.height/spacer);
    CGFloat padding = 0.0f;
    CGMutablePathRef hatchPath = CGPathCreateMutable();
    for(int i=1; i<=rows; i++) {
        CGPathMoveToPoint(hatchPath, NULL, spacer * i, padding);
        CGPathAddLineToPoint(hatchPath, NULL, padding, spacer * i);
    }
    CGContextAddPath(context, hatchPath);
    CGPathRelease(hatchPath);
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetLineCap(context, kCGLineCapRound);
    UIColor *hatchStrokeColor = [colorDictionary objectForKey:@"hatchStrokeColor"];
    CGContextSetStrokeColorWithColor(context, hatchStrokeColor.CGColor);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextRestoreGState(context); //Restore Last Context State Before Clipping "hatchPath"
    
    // draw a separating line
    CGMutablePathRef linePath = CGPathCreateMutable();
    CGFloat linePathY = (buttonOffset - 1.0f); //location to draw line (between labels and buttons)
    CGPathMoveToPoint(linePath, NULL, 0.0f, linePathY);
    CGPathAddLineToPoint(linePath, NULL, activeBounds.size.width, linePathY); //draw line to with of bounds
    CGContextAddPath(context, linePath);
    CGPathRelease(linePath);
    CGContextSetLineWidth(context, 1.0f);
    CGContextSaveGState(context); //Save Context State Before Drawing "linePath" Shadow
    UIColor *linebreakStrokeColor = [colorDictionary objectForKey:@"linebreakStrokeColor"];
    CGContextSetStrokeColorWithColor(context, linebreakStrokeColor.CGColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 0.0f, linebreakStrokeColor.CGColor);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextRestoreGState(context); //Restore Context State After Drawing "linePath" Shadow

    // creating an inner shadow (for the alert view, uses original bezier path from before
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, 3.0f);
    UIColor *alertInnerStrokeColor = [colorDictionary objectForKey:@"alertInnerStrokeColor"];
    CGContextSetStrokeColorWithColor(context, alertInnerStrokeColor.CGColor);
    UIColor *alertInnerShadowColor = [colorDictionary objectForKey:@"alertInnerShadowColor"];
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.0f), 6.0f, alertInnerShadowColor.CGColor);
    CGContextDrawPath(context, kCGPathStroke);
    
    // redraw the path to avoid pixilation
    CGContextRestoreGState(context); //Restore First Context State Before Clipping "path"
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, 3.0f);
    UIColor *alertRedrawStrokeColor = [colorDictionary objectForKey:@"alertRedrawStrokeColor"];
    CGContextSetStrokeColorWithColor(context, alertRedrawStrokeColor.CGColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.0f), 0.0f, alertRedrawStrokeColor.CGColor);
    CGContextDrawPath(context, kCGPathStroke);
}
// added |genereColorsForTextBorderBackgroundHatchAndLinebreak| method for default customization
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if (colorDictionary == nil) {
            // following method call is used as default (in case user didnt call this method when
            // creating custom alert view)
            [self generateColorsForText:0xD2D2D2 border:0xD2D2D2 background:0xFFFFFF hatch:0xFFFFFF andLinebreak:0xFFFFFF];
        }
    }
    return self;
}

@end
