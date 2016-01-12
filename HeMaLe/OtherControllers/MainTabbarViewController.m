//
//  MainTabbarViewController.m
//  HaMaLe
//
//  Created by Air on 16/1/6.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "PersonalCenterViewController.h" 
#import "StoreViewController.h"
#import "ShareViewController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "MyTabbar.h"
@interface MainTabbarViewController ()<MyTabbarDelegate>

@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建子控制器
    [self createSubViewControllers];
    
    
    //创建自定义的tabbar
    [self createCustomTabbar];
    
}

#pragma mark 创建自定义的分栏元素项
-(void) createCustomTabbar
{
    //隐藏系统bar
    self.tabBar.hidden = YES;
    // 创建自定义的tabbar
    MyTabbar *myTabbar = [[MyTabbar alloc] initWithFrame:self.tabBar.frame itemCount:self.viewControllers.count];
    myTabbar.delegate = self;
    [self.view addSubview:myTabbar];
}


#pragma mark 创建子控制器
-(void)createSubViewControllers
{
    //视频
    VideoViewController * videoVC = [[VideoViewController alloc] init];
    UINavigationController * videoNav = [[UINavigationController alloc] initWithRootViewController:videoVC];
    //商城
    StoreViewController * storeVC = [[StoreViewController alloc] init];
    UINavigationController * storeNav = [[UINavigationController alloc] initWithRootViewController:storeVC];
    //资讯
    NewsViewController * newsVC = [[NewsViewController alloc] init];
    UINavigationController * newsNav = [[UINavigationController alloc] initWithRootViewController:newsVC];
    //分享
    ShareViewController * shareVC = [[ShareViewController alloc] init];
    UINavigationController * shareNav = [[UINavigationController alloc] initWithRootViewController:shareVC];
    //个人中心
    PersonalCenterViewController * personVC = [[PersonalCenterViewController alloc] init];
    UINavigationController * personNav = [[UINavigationController alloc] initWithRootViewController:personVC];
    
    self.viewControllers = @[newsNav,shareNav,videoNav,storeNav,personNav];

}


#pragma mark 实现mytabbar代理方法
-(void)myTabbar:(MyTabbar *)tabbar btnClicked:(int)index
{
    self.selectedIndex = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
