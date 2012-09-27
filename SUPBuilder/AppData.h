//
//  AppData.h
//  LeaveRequests
//
//  Created by Andrew Furusawa on 9/27/12.
//  Copyright (c) 2012 Andrew Furusawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppData : NSObject

@property BOOL isSUPConnection;
@property (weak, nonatomic) NSString *username;

+ (id)sharedInstance;


@end
