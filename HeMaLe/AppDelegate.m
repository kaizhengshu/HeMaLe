//
//  AppDelegate.m
//  HeMaLe
//
//  Created by Air on 16/1/11.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"
#import "LoginViewController.h"
#import "MainTabbarViewController.h"

@interface AppDelegate ()
{
    UINavigationController * _navigationController;
    UIScrollView * _welcomeSV;
    BOOL _isAlredayLogin;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NSDictionary * infoDict = [NSBundle mainBundle].infoDictionary;
    //取出当前版本
    NSString * currentVersion = [infoDict objectForKey:(NSString *)kCFBundleVersionKey];
    //取出保存的版本号
    NSString * saveVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"version"];
    if (saveVersion == nil) {
        saveVersion = @"0";
    }
    
    //版本号相同进入主页 不同进入欢迎页
    if (![currentVersion isEqualToString:saveVersion]) {
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"version"];
        //是首次登陆
        GuideViewController *guideVC = [[GuideViewController alloc]init];
        self.window.rootViewController = guideVC;
        //存储当前版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"version"];
        
    }else{
        //不是首次登陆
        
        //判断是否已经登陆了
        _isAlredayLogin = 1;
        //本地存储是已经登陆 则直接登陆 进入主页
        if (1 == _isAlredayLogin) {
            MainTabbarViewController *mainTabbarVC = [[MainTabbarViewController alloc] init];
            self.window.rootViewController = mainTabbarVC;
        }else
        {
            //否则需要用户手动输入
            GuideViewController * login = [[GuideViewController alloc] init];
            UINavigationController * loginNav = [[UINavigationController alloc] initWithRootViewController:login];
            self.window.rootViewController = loginNav;
        }
    }
    
    
    [self.window makeKeyAndVisible];
    return YES;
}



#pragma mark 引导页
-(void)gotoScrollView
{
    
    //初始化引导页
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    for (int i = 0; i <4; i++) {
        UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"yindaoye%i",i]];
        [scrollView addSubview:iv];
        
        if (3 == i) {
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - 80) / 2, kScreenHeight - 300, 80, 40)];
            btn.backgroundColor = [UIColor orangeColor];
            [btn setTitle:@"进入应用" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(gotoTabbarController) forControlEvents:UIControlEventTouchUpInside];
            iv.userInteractionEnabled = YES;
            [iv addSubview:btn];
        }
        scrollView.pagingEnabled = YES;
        
        scrollView.contentSize = CGSizeMake(kScreenWidth * 4, 0);
        [self.window addSubview:scrollView];
        _welcomeSV = scrollView;
    }
    
}


#pragma mark 进入主页
-(void)gotoTabbarController
{
    //移除欢迎页
    [UIView animateWithDuration:0.5 animations:^{
        _welcomeSV.transform = CGAffineTransformMakeScale(1.5, 1.5);
        _welcomeSV.alpha = 0.5;
        
        
    }completion:^(BOOL finished) {
        [_welcomeSV removeFromSuperview];
    }];
    MainTabbarViewController *mainTabbarVC = [[MainTabbarViewController alloc] init];
    self.window.rootViewController = mainTabbarVC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
