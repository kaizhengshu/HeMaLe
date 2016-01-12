//
//  LoginViewController.m
//  HaMaLe
//
//  Created by Air on 16/1/7.
//  Copyright © 2016年 Air. All rights reserved.
//

#import "LoginViewController.h"
#import "MainTabbarViewController.h"
#import "ForgetViewController.h"
#import "RegisterViewController.h"
#import "AppDelegate.h"
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    //设置背景
    [self defineBackGround];
   // 添加输入框 登陆按钮
    [self setUI];
    //监听键盘
    //键盘即将出现
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //键盘即将收起
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}

#pragma mark 点击空白处移除键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark 键盘通知
-(void)keyboardWillShow:(NSNotification *)noti
{
#warning 添加判断高度代码
    //判断键盘高度是否超过textField的最大Y值
    
    
    
    
    NSDictionary *dict = noti.userInfo;
    CGRect keyboardFrame = [dict[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 取出键盘弹出时长
    NSTimeInterval duration = [dict[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
    ;
    CGFloat jumpHeight = keyboardFrame.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, -jumpHeight+80);
    }];
}

#pragma mark - 文本框代理方法
#pragma mark 点击return按钮
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}


-(void)keyboardWillHide:(NSNotification *)noti
{
    NSDictionary *dict = noti.userInfo;
    // 取出键盘弹出时长
    NSTimeInterval duration = [dict[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{

        self.view.transform = CGAffineTransformIdentity ;
    }];
    [_txt1 resignFirstResponder];
    [_txt2 resignFirstResponder];
    [_txt3 resignFirstResponder];
    
}


-(void)defineBackGround
{
    //添加模糊化背景效果
    UIBlurEffect * beffect  = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * blurView = [[UIVisualEffectView alloc] initWithEffect:beffect];
    blurView.frame = self.view.bounds;
    blurView.alpha = 0.88;
    [self.view addSubview:blurView];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"登陆背景"]];
}


#pragma mark 点击事件
//登陆
- (void)goLogin:(id)sender
{
    
    MainTabbarViewController *mainTabbarVC = [[MainTabbarViewController alloc] init];
    [self presentViewController:mainTabbarVC animated:YES completion:nil];

}
//跳转到忘记密码界面
-(void )goForget:(id)sender
{
    [self endAllediting];
    ForgetViewController *forgetVC = [[ForgetViewController alloc]init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}

//移除输入状态
-(void)endAllediting
{
    if (_txt3.isEditing == YES) {
        [_txt3 resignFirstResponder];
    }else if(_txt2.isEditing == YES){
        [_txt2 resignFirstResponder];
    }else if(_txt3.isEditing == YES){
        [_txt3 resignFirstResponder];
    }
}

//注册
-(void )goRegister:(id)sender
{
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    [self presentViewController:registerVC animated:YES completion:nil];
    
    
}
#pragma mark UI设定
//设置UI
-(void)setUI
{
    _txt1 = [[JYTextField alloc]initWithFrame:CGRectMake(30, 200, kScreenWidth - 60, 38)
                                  cornerRadio:5
                                  borderColor:RGB(166, 166, 166)
                                  borderWidth:2
                                   lightColor:RGB(243, 168, 51)
                                    lightSize:8
                             lightBorderColor:RGB(235, 235, 235)];
    [_txt1 setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_txt1 setPlaceholder:@"手机号"];
    _txt1.keyboardType = UIKeyboardTypePhonePad;
    
    [self.view addSubview:_txt1];
    
    _txt2 = [[JYTextField alloc]initWithFrame:CGRectMake(30, 250, kScreenWidth - 60, 38)
                                  cornerRadio:5
                                  borderColor:RGB(166, 166, 166)
                                  borderWidth:2
                                   lightColor:RGB(243, 168, 51)
                                    lightSize:8
                             lightBorderColor:RGB(235, 235, 235)];
    [_txt2 setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_txt2 setPlaceholder:@"密码"];
    [_txt2 setSecureTextEntry:YES];
    [self.view addSubview:_txt2];
    
    _txt3 = [[JYTextField alloc]initWithFrame:CGRectMake(30, 300, kScreenWidth - 60, 38)
                                  cornerRadio:5
                                  borderColor:RGB(166, 166, 166)
                                  borderWidth:2
                                   lightColor:RGB(243, 168, 51)
                                    lightSize:8
                             lightBorderColor:RGB(235, 235, 235)];
    [_txt3 setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_txt3 setPlaceholder:@"验证码"];
    [self.view addSubview:_txt3];
    
    //设置textField的透明度
    _txt1.alpha = 0.3;
    _txt1.backgroundColor = [UIColor clearColor];
    _txt1.textColor = [UIColor whiteColor];
    
    //添加登陆
    _loginButton= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setTintColor:RGB(139, 23, 43)];
    _loginButton.backgroundColor = [UIColor greenColor];
    
    [_loginButton setFrame:CGRectMake(30, 350, kScreenWidth - 60, 38)];
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(goLogin:) forControlEvents:UIControlEventTouchUpInside];
    //设置倒角
    _loginButton.layer.cornerRadius = 8;
    _loginButton.layer.masksToBounds = YES;
    [self.view addSubview:_loginButton];
    
    //忘记密码
    _forgetButton= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //[_forgetButton setTintColor:RGB(139, 23, 43)];
    
    
    [_forgetButton setFrame:CGRectMake(40, 390, 60, 38)];
    [_forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    _forgetButton.titleLabel.textColor = [UIColor whiteColor];
    _forgetButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_forgetButton addTarget:self action:@selector(goForget:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetButton];
    
    
    //注册
    _registerButton= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_registerButton setTintColor:RGB(139, 23, 43)];
    
    
    [_registerButton setFrame:CGRectMake(kScreenWidth-60, 15, 40, 38)];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(goRegister:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    _txt1.delegate = self;
    _txt2.delegate = self;
    _txt3.delegate = self;
    

}


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
