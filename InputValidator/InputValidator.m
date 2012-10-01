//
//  InputValidator.m
//  LeaveRequests
//
//  Created by Andrew Furusawa on 9/27/12.
//  Copyright (c) 2012 Andrew Furusawa. All rights reserved.
//

#import "InputValidator.h"

@implementation InputValidator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (void)validatePhoneNumberForString:(NSString *)input
{
    NSString *value = @"";
    if ([input length] == 0) {
        
    }
}


@end
