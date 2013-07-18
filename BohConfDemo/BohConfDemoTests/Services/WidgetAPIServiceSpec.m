#import "Kiwi.h"
#import "WidgetAPIService.h"
#import "Widget.h"

SPEC_BEGIN(WidgetAPIServiceSpec)

describe(@"WidgetAPIService", ^{
    it(@"Can get a widget", ^{
        
        Widget *widget = [WidgetAPIService getWidget:1];
        
//        NSURL *url = [NSURL URLWithString:@"http://httpbin.org/ip"];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        
//        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//            NSLog(@"IP Address: %@", [JSON valueForKeyPath:@"origin"]);
//        } failure:nil];
//        
//        [operation start];

        NSUInteger a = 16;
        NSUInteger b = 26;
        [[theValue(a + b) should] equal:theValue(43)];
    });
});

SPEC_END