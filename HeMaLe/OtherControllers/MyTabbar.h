//
//  MyTabbar.h
//  HaMaLe
//
//  Created by Air on 16/1/7.
//  Copyright © 2016年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  MyTabbar;
//设置代理
@protocol MyTabbarDelegate <NSObject>

- (void)myTabbar:(MyTabbar *)tabbar btnClicked:(int)index;

@end
@interface MyTabbar : UIView
/** 初始化方法
 参数1: 位置大小
 参数2: 内部按钮个数
 */

-(instancetype)initWithFrame:(CGRect)frame itemCount:(int)itemCount;
//设置代理属性
@property (nonatomic , weak) id <MyTabbarDelegate> delegate;

@end
