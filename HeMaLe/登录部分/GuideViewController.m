//
//  GuideViewController.m
//  HaMaLe
//
//  Created by Air on 16/1/6.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "GuideViewController.h"
#import "LoginViewController.h"

@interface GuideViewController ()
{
    UIScrollView *_welcomeSV;
    
}
@end

@implementation GuideViewController

- (void)viewDidLoad {
     [super viewDidLoad];
     [self gotoScrollView];
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
        [self.view addSubview:scrollView];
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
            
            
            LoginViewController *loginIN = [[LoginViewController alloc]init];
            [self presentViewController:loginIN animated:YES completion:nil];

            
        }completion:^(BOOL finished) {
            [_welcomeSV removeFromSuperview];
            
        }];
    
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
