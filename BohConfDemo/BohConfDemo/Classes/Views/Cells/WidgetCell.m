
#import "WidgetCell.h"

#import "Widget.h"

@implementation WidgetCell

- (void)configure:(Widget *)widget
{
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
    self.nameLabel.text = widget.name;
    [self addSubview:self.nameLabel];
}

@end