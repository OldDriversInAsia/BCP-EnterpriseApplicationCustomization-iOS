//
//  ViewController.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/12.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *login;
@property (nonatomic, strong) UIButton *test;
@property (nonatomic, strong) UIButton *clear;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIButton *)login {
    if (!_login) {
        _login = [UIButton buttonWithType:UIButtonTypeSystem];
        [_login setTitle:@"login" forState:UIControlStateNormal];
        [_login setBackgroundColor:[UIColor cyanColor]];
        [_login setFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 100)];
        [_login setCenterX:half_of(kScreenWidth)];
        [_login setCenterY:kScreenHeight * 0.4];
        
        [_login addTapAction:^(id sender) {
            [NetworkUtil POSTPath:BCP_LOGIN parameters:@{@"loginName":@"lidada1",@"password":@"123456"} success:^(NSURLSessionDataTask *task, id responseObject, NSString *JSONString) {
                NSLog(@"%@",JSONString);
            }];
        }];
    }
    return _login;
}

- (UIButton *)test {
    if (!_test) {
        _test = [UIButton buttonWithType:UIButtonTypeSystem];
        [_test setTitle:@"test" forState:UIControlStateNormal];
        [_test setBackgroundColor:[UIColor yellowColor]];
        [_test setFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 100)];
        [_test setCenterX:half_of(kScreenWidth)];
        [_test setCenterY:kScreenHeight * 0.6];
        
        [_test addTapAction:^(id sender) {
            [NetworkUtil GETPath:BCP_TEST parameters:@{@"param":@"Hello,world!"} success:^(NSURLSessionDataTask *task, id responseObject, NSString *JSONString) {
                NSLog(@"%@",JSONString);
            }];
        }];
    }
    return _test;
}

- (UIButton *)clear {
    if (!_clear) {
        _clear = [UIButton buttonWithType:UIButtonTypeSystem];
        [_clear setTitle:@"clear" forState:UIControlStateNormal];
        [_clear setBackgroundColor:[UIColor purpleColor]];
        [_clear setFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 100)];
        [_clear setCenterX:half_of(kScreenWidth)];
        [_clear setCenterY:kScreenHeight * 0.8];
        
        [_clear addTapAction:^(id sender) {
            [[BCPCookieManager shareManager] clear];
        }];
    }
    return _clear;
}

- (void)bcpInitView {
    [super bcpInitView];
    [self.view addSubview:self.login];
    [self.view addSubview:self.test];
    [self.view addSubview:self.clear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 git branch
 git add .
 git commit -am "20180121"
 git push origin develop:develop
 git checkout master
 git branch
 git merge develop
 git push origin master:master
 */


@end
