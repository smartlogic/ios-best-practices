
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
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[WidgetCell class] forCellReuseIdentifier:WidgetCellIdentifier];
    
    self.dataSource = [[WidgetsTableDataSource alloc] init];
    self.tableView.dataSource = self.dataSource;
    
    [WidgetAPIService getWidgets:^(NSMutableArray *widgets) {
        self.dataSource.items = widgets;
        [self.tableView reloadData];
    }];
    
}

@end