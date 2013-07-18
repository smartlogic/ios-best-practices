//
//  NSDate+Timestamps.m
//  BohConfDemo
//
//  Created by Tom von Schwerdtner on 7/17/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import "NSDate+Timestamps.h"

@implementation NSDate (Timestamps)

+(id)dateWithTimestamp:(NSString *)string
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    return [dateFormatter dateFromString:string];
}

@end
