//
//  MyTabbar.m
//  HaMaLe
//
//  Created by Air on 16/1/7.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "MyTabbar.h"
#import "MyTabbarItemButton.h"
@interface MyTabbar()
{
    int         _itemCount;   // 子控制器个数
    UIButton    *_previousBtn; // 前一个按钮
}
@end
@implementation MyTabbar

-(instancetype) initWithFrame:(CGRect)frame itemCount:(int)itemCount
{
    if (self = [super initWithFrame:frame]) {
    //保存按钮个数
    _itemCount = itemCount;
    //设置背景颜色为图片
    self.backgroundColor = [UIColor lightGrayColor];
    //创建按钮
    [self createBtn];
    }
    return self;
}

-(void)createBtn
{
    //循环创建按钮
    //集散按钮的高度
    CGFloat width = self.bounds.size.width / _itemCount;
    CGFloat height = self.bounds.size.height;
    NSArray *titleArr = @[@"资讯", @"分享", @"视频", @"商城", @"个人"];
    for (int i = 0; i < _itemCount; i ++) {
        MyTabbarItemButton *btn = [[MyTabbarItemButton alloc] initWithFrame:CGRectMake(i * width, 0, width, height) imgName:[NSString stringWithFormat:@"xiadaohang%i", i+1] selectedImgName:[NSString stringWithFormat:@"liangxiadaohang%i", i+1] titleColor:[UIColor whiteColor] title:titleArr[i]];
        
        btn.tag = i;
        // 添加按钮的点击事件
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        if (0 == i) {
            [self btnClicked:btn];
        }
    }
}

-(void)btnClicked:(UIButton *)btn
  {
      _previousBtn.selected = NO;
      btn.selected = YES;
      
      _previousBtn = btn;
      
      if ([_delegate respondsToSelector:@selector(myTabbar:btnClicked:)]) {
          [_delegate myTabbar:self btnClicked:btn.tag];
      }

  }





@end
