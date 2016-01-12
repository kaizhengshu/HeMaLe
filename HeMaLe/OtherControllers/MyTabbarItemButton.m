//
//  MyTabbarItemButton.m
//  HaMaLe
//
//  Created by Air on 16/1/7.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "MyTabbarItemButton.h"

@implementation MyTabbarItemButton

- (instancetype)initWithFrame:(CGRect)frame imgName:(NSString *)imgName selectedImgName:(NSString *)selectedImgName titleColor:(UIColor *)color title:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        // 设置文字，图片，文字颜色
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:color forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:selectedImgName] forState:UIControlStateSelected];
        
        // 设置文字和图片的位置
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:10];
    }
    
    return self;
}

#pragma mark 设置高亮状态的方法
// 在这个方法里面，系统会默认给按钮设置高亮状态的的情景
// 覆盖此方法，会使按钮的高亮状态不呈现任何情景
- (void)setHighlighted:(BOOL)highlighted {}

#pragma mark 设置文字frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat btnHeight = self.bounds.size.height;
    CGFloat btnWidth = self.bounds.size.width;
    
    return CGRectMake(0, btnHeight*0.6, btnWidth,btnHeight*0.4);
}

#pragma mark 设置图片frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat btnHeight = self.bounds.size.height;
    CGFloat btnWidth = self.bounds.size.width;
   
    return CGRectMake(0,0, btnWidth, btnHeight*0.6);
}

@end
