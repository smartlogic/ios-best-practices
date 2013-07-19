#import "Kiwi.h"

#import "WidgetsTableDataSource.h"
#import "WidgetCell.h"
#import "Widget.h"

SPEC_BEGIN(WidgetsTableDataSourceSpec)

describe(@"WidgeetsTableDataSource", ^{
    it(@"Configures WidgetsCells based on Widgets available", ^{
        UITableView *tableView = [[UITableView alloc] init];
        WidgetsTableDataSource *dataSource = [[WidgetsTableDataSource alloc] init];
        
        Widget *widgetOne =[[Widget alloc] init];
        widgetOne.name = @"First Widget";
        
        Widget *widgetTwo =[[Widget alloc] init];
        widgetTwo.name = @"Second Widget";
        dataSource.items = [@[widgetOne, widgetTwo] mutableCopy];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        UITableViewCell *widgetCell = [tableView cellForRowAtIndexPath:indexPath];
        
        [[((WidgetCell *)widgetCell).nameLabel.text should] equal:@"First Widget"];
    });
});

SPEC_END