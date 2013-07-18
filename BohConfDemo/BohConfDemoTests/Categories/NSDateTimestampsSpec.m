#import "Kiwi.h"

#import "NSDate+Timestamps.h"

SPEC_BEGIN(NSDateTimestampsSpec)

describe(@"NSDate+Timestamps", ^{
    it(@"Initializes an NSDate from a timestamp string", ^{
        
        NSString *timestamp = @"2010-02-03T04:05:06Z";
        NSDate *date = [NSDate dateWithTimestamp:timestamp];
        
        NSUInteger units = NSDayCalendarUnit | NSMonthCalendarUnit| NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        NSDateComponents *components = [[NSCalendar currentCalendar] components:units fromDate:date];
        
        [[theValue(components.year) should] equal:theValue(2010)];
        [[theValue(components.month) should] equal:theValue(2)];
        [[theValue(components.day) should] equal:theValue(3)];
        [[theValue(components.hour) should] equal:theValue(4)];
        [[theValue(components.minute) should] equal:theValue(5)];
        [[theValue(components.second) should] equal:theValue(6)];
    });
});

SPEC_END