//
//  WidgetAPIService.h
//  BohConfDemo
//
//  Created by Tom von Schwerdtner on 7/17/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Widget.h"

@interface WidgetAPIService : NSObject

+ (void)getWidget:(NSInteger)wid success:(void (^)(Widget *))successBlock;

@end
