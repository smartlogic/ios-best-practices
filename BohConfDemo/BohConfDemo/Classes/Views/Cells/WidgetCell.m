//
//  WidgetCell.m
//  BohConfDemo
//
//  Created by Tom von Schwerdtner on 7/18/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import "WidgetCell.h"

@implementation WidgetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
