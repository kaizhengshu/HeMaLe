//
//  PersonallCenterCell.h
//  HeMaLe
//
//  Created by Air on 16/1/11.
//  Copyright © 2016年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonallCenterCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellIIcon;

@property (weak, nonatomic) IBOutlet UILabel *cellTitle;

-(instancetype)initWithTableView:(UITableView *)tableView withIdentifier:(NSString *)strID;
@end
