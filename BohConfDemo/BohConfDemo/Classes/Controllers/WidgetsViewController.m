
#import "WidgetsViewController.h"

#import "WidgetsTableDataSource.h"
#import "WidgetAPIService.h"
#import "WidgetCell.h"

@interface WidgetsViewController ()
@property (nonatomic, strong) WidgetsTableDataSource *dataSource;
@end

@implementation WidgetsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view = [[UITableView alloc] initWithFrame:self.view.frame];
    
    [(UITableView *)self.view registerClass:[WidgetCell class] forCellReuseIdentifier:WidgetCellIdentifier];
    
    self.dataSource = [[WidgetsTableDataSource alloc] init];
    ((UITableView *)self.view).dataSource = self.dataSource;
    
    [WidgetAPIService getWidgets:^(NSMutableArray *widgets) {
        self.dataSource.items = widgets;
        [(UITableView *)self.view reloadData];
    }];
    
}

@end