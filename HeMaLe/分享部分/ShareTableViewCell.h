//
//  ShareTableViewCell.h
//  HeMaLe
//
//  Created by Air on 16/1/12.
//  Copyright © 2016年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *shareContent;
@property (weak, nonatomic) IBOutlet UIImageView *shareImage;

@end
