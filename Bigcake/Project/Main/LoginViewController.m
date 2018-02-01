//
//  LoginViewController.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/12.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginView *loginView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (LoginView *)loginView {
    if (!_loginView) {
        _loginView = [[LoginView alloc] init];
        [_loginView setFrame:self.view.bounds];
        [_loginView initView];
    }
    return _loginView;
}

- (void)bcpInitView {
    [super bcpInitView];
    [self.view addSubview:self.loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
