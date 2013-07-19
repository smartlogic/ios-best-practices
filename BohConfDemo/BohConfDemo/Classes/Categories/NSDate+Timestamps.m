
#import "NSDate+Timestamps.h"

@implementation NSDate (Timestamps)

+(id)dateWithTimestamp:(NSString *)string
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    return [dateFormatter dateFromString:string];
}

@end
