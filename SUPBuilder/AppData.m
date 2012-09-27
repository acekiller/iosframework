//
//  AppData.m
//  LeaveRequests
//
//  Created by Andrew Furusawa on 9/27/12.
//  Copyright (c) 2012 Andrew Furusawa. All rights reserved.
//

#import "AppData.h"

@implementation AppData
@synthesize isSUPConnection, username;
static AppData *sharedInstance = nil;

+ (AppData *)sharedInstance {
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        sharedInstance = [[AppData alloc] init];
    });
    
    return sharedInstance;
}

// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    
    if (self) {
        // Work your initializing magic here as you normally would
    }
    
    return self;
}


// Equally, we don't want to generate multiple copies of the singleton.
- (id)copyWithZone:(NSZone *)zone {
    return self;
}




@end
