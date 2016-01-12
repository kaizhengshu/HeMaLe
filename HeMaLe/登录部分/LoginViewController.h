//
//  LoginViewController.h
//  HaMaLe
//
//  Created by Air on 16/1/7.
//  Copyright © 2016年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYTextField.h"
@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    JYTextField *_txt1;
    JYTextField *_txt2;
    JYTextField *_txt3;
    UIButton *_loginButton;
    UIButton *_registerButton;
    UIButton *_forgetButton;
}
@end
