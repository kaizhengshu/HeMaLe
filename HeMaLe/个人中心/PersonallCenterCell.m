//
//  PersonallCenterCell.m
//  HeMaLe
//
//  Created by Air on 16/1/11.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "PersonallCenterCell.h"

@implementation PersonallCenterCell


-(instancetype)initWithTableView:(UITableView *)tableView withIdentifier:(NSString *)strID;
{
    PersonallCenterCell * cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"PersonallCenterCell" owner:nil options:nil][0];
    }
    return cell;
}


-(void)setIcon:(UIImageView *)icon
{
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
