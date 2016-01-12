//
//  VideoTableViewCell.h
//  HeMaLe
//
//  Created by Air on 16/1/12.
//  Copyright © 2016年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *horseImage;
@property (weak, nonatomic) IBOutlet UILabel *owner;
@property (weak, nonatomic) IBOutlet UILabel *horseName;
@property (weak, nonatomic) IBOutlet UILabel *horseType;
@property (weak, nonatomic) IBOutlet UILabel *horseBirth;
@property (weak, nonatomic) IBOutlet UILabel *horseAddress;

@end
