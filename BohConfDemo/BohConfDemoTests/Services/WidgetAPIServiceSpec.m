#import "Kiwi.h"
#import "Nocilla.h"

#import "WidgetAPIService.h"
#import "Widget.h"

SPEC_BEGIN(WidgetAPIServiceSpec)

beforeEach(^{
    [[LSNocilla sharedInstance] start];
});

afterEach(^{
    [[LSNocilla sharedInstance] stop];
    [[LSNocilla sharedInstance] clearStubs];
});

describe(@"WidgetAPIService", ^{
    
    beforeEach(^{
        // NOTE: It would be less error-prone to generate an NSDictionary and convert that to JSON and then an NSString
        NSString *response = @"{\"id\":1,\"name\":\"Sample Title\",\"description\":\"Sample Description\"}";
        
        stubRequest(@"GET", @"http://localhost:3000/widgets/1.json").
        andReturn(201).
        withHeaders(@{@"Content-Type": @"application/json"}).
        withBody(response);
        
        // NOTE: It would be less error-prone to generate an NSDictionary and convert that to JSON and then an NSString
        NSString *listResponse = @"[{\"id\":1,\"name\":\"First Title\",\"description\":\"First Description\"},{\"id\":1,\"name\":\"Second Title\",\"description\":\"Second Description\"}]";
        
        stubRequest(@"GET", @"http://localhost:3000/widgets.json").
        andReturn(201).
        withHeaders(@{@"Content-Type": @"application/json"}).
        withBody(listResponse);
        
    });
    
    it(@"Can fetch a widget by id", ^{
        
        __block Widget *result = nil;

        [WidgetAPIService getWidget:1 success:^(Widget *widget) {
            result = widget;
        }];
        
        [[expectFutureValue(result) shouldEventually] beNonNil];
        [[expectFutureValue(result.name) shouldEventually] equal:@"Sample Title"];
        [[expectFutureValue(result.text) shouldEventually] equal:@"Sample Description"];
        
    });
    
    it(@"Can fetch a list of widgets", ^{
        
        __block NSMutableArray *result = nil;
        __block Widget *widget = nil;
        
        [WidgetAPIService getWidgets:^(NSMutableArray *widgets) {
            result = widgets;
            widget = [result lastObject];
        }];
        
        [[expectFutureValue(result) shouldEventually] haveCountOf:2];
        
        [[expectFutureValue(widget.name) shouldEventually] equal:@"Second Title"];
        [[expectFutureValue(widget.text) shouldEventually] equal:@"Second Description"];
        
    });
});

SPEC_END