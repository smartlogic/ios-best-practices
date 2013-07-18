//
//  WidgetAPIService.m
//  BohConfDemo
//
//  Created by Tom von Schwerdtner on 7/17/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import "WidgetAPIService.h"

#import "AFNetworking.h"

@implementation WidgetAPIService

+ (void)getWidgets:(void (^)(NSMutableArray *))successBlock
{
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/widgets.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id json) {
                                                        
                                                        NSMutableArray *results = [@[] mutableCopy];
                                                        
                                                        for(NSDictionary *item in (NSArray *)json){
                                                            Widget *widget = [[Widget alloc] init];
                                                            widget.name = item[@"name"];
                                                            widget.text = item[@"description"];
                                                            [results addObject:widget];
                                                        }
                                                        
                                                        successBlock(results);
                                                        
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        NSLog(@"Something went horribly wrong.");
                                                    }];
    
    [operation start];
    
}

+ (void)getWidget:(NSInteger)wid success:(void (^)(Widget *))successBlock
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:3000/widgets/%d.json", wid]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id json) {
                                                        NSDictionary *data = (NSDictionary *)json;
                                                        
                                                        Widget *widget = [[Widget alloc] init];
                                                        
                                                        widget.name = data[@"name"];
                                                        widget.text = data[@"description"];
                                                        
                                                        successBlock(widget);
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        NSLog(@"Something went horribly wrong.");
                                                    }];
    
    [operation start];
}

@end
