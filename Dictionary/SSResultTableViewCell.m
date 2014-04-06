//
//  SSResultTableViewCell.m
//  Dictionary
//
//  Created by Sairam Sankaran on 4/5/14.
//  Copyright (c) 2014 Sairam Sankaran. All rights reserved.
//

#import "SSResultTableViewCell.h"

@implementation SSResultTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
