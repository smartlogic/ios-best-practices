
#import <Foundation/Foundation.h>

static NSString *const WidgetCellIdentifier = @"WidgetCellIdentifier";

@interface WidgetsTableDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *items;

@end
