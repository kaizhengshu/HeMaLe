//
//  NewsCell.m
//  HeMaLe
//
//  Created by Air on 16/1/11.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell


-(void)refreshData:(NewsModel *)news
{
    self.newsTitle.text   = news.newsTitleModel;
    self.newsContent.text = news.newsContentModel;
    self.newsDate.text    = news.newsDateModel;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
