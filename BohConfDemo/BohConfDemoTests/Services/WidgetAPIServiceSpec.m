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
});

SPEC_END