//
//  Widget.m
//  BohConfDemo
//
//  Created by Tom von Schwerdtner on 7/17/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import "Widget.h"

@implementation Widget

- (NSString *)description
{
    return [NSString stringWithFormat:@"Widget\n\tname:%@\n\ttext:%@", self.name, self.text];
}

@end
