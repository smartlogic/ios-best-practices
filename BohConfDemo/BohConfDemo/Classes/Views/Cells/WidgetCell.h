
#import <UIKit/UIKit.h>

@class Widget;

@interface WidgetCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;

- (void)configure:(Widget *)widget;

@end
