
#import "WidgetsTableDataSource.h"
#import "WidgetCell.h"

@implementation WidgetsTableDataSource

- (id)init
{
    self = [super init];
    if (self) {
        self.items = [@[] mutableCopy];
    }
    return self;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WidgetCell *cell = [tableView dequeueReusableCellWithIdentifier:WidgetCellIdentifier forIndexPath:indexPath];
    [cell configure:[self.items objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

@end
