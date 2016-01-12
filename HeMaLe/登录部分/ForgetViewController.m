//
//  ForgetViewController.m
//  HaMaLe
//
//  Created by Air on 16/1/8.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "ForgetViewController.h"

#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface ForgetViewController ()

@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUI];
    
    // Do any additional setup after loading the view.
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    
    navView.backgroundColor = [UIColor redColor];
    [self.view addSubview:navView];
    
    
    
    UIButton *goBack= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBack.backgroundColor = [UIColor greenColor];
    
    
    [goBack setFrame:CGRectMake(0, 20, 60, 44)];
    [goBack setTitle:@"返回" forState:UIControlStateNormal];
    [goBack addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBack];
    
    
        
}


-(void)setUI
{
    _num = [[JYTextField alloc]initWithFrame:CGRectMake(30, 150, kScreenWidth - 60, 38)
                                  cornerRadio:5
                                  borderColor:RGB(166, 166, 166)
                                  borderWidth:2
                                   lightColor:RGB(243, 168, 51)
                                    lightSize:8
                             lightBorderColor:RGB(235, 235, 235)];
    [_num setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_num setPlaceholder:@"手机号"];
    _num.keyboardType = UIKeyboardTypePhonePad;
    
    [self.view addSubview:_num];
    
    
    _identify = [[JYTextField alloc]initWithFrame:CGRectMake(30, _num.frame.origin.y+50, kScreenWidth - 60, 38)
                                  cornerRadio:5
                                  borderColor:RGB(166, 166, 166)
                                  borderWidth:2
                                   lightColor:RGB(243, 168, 51)
                                    lightSize:8
                             lightBorderColor:RGB(235, 235, 235)];
    [_identify setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_identify setPlaceholder:@"验证码"];
    [self.view addSubview:_identify];
    
    
    _password = [[JYTextField alloc]initWithFrame:CGRectMake(30, _num.frame.origin.y+100, kScreenWidth - 60, 38)
                                  cornerRadio:5
                                  borderColor:RGB(166, 166, 166)
                                  borderWidth:2
                                   lightColor:RGB(243, 168, 51)
                                    lightSize:8
                             lightBorderColor:RGB(235, 235, 235)];
    [_password setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_password setPlaceholder:@"密码"];
    [_password setSecureTextEntry:YES];
    [self.view addSubview:_password];
    
    
    _confirm = [[JYTextField alloc]initWithFrame:CGRectMake(30, _num.frame.origin.y+150, kScreenWidth - 60, 38)
                                      cornerRadio:5
                                      borderColor:RGB(166, 166, 166)
                                      borderWidth:2
                                       lightColor:RGB(243, 168, 51)
                                        lightSize:8
                                 lightBorderColor:RGB(235, 235, 235)];
    [_confirm setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_confirm setPlaceholder:@"确认密码"];
    [_confirm setSecureTextEntry:YES];
    [self.view addSubview:_confirm];
    
    
}

-(void)goBack:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

//界面消失前 隐藏键盘
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
