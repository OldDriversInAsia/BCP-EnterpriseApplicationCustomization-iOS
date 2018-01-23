//
//  ViewController.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/12.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *button1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"login" forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor cyanColor]];
        [_button setFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 100)];
        [_button setCenterX:half_of(kScreenWidth)];
        [_button setCenterY:kScreenHeight * 0.6];
        
        [_button addTapAction:^(id sender) {
            [NetworkUtil POSTPath:BCP_LOGIN parameters:@{@"loginName":@"lidada1",@"password":@"123456"} success:^(NSURLSessionDataTask *task, id responseObject, NSString *JSONString) {
                NSLog(@"%@",JSONString);
            }];
        }];
    }
    return _button;
}

- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button1 setTitle:@"test" forState:UIControlStateNormal];
        [_button1 setBackgroundColor:[UIColor yellowColor]];
        [_button1 setFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 100)];
        [_button1 setCenterX:half_of(kScreenWidth)];
        [_button1 setCenterY:kScreenHeight * 0.8];
        
        [_button1 addTapAction:^(id sender) {
            [NetworkUtil GETPath:BCP_TEST parameters:@{@"param":@"Hello,world!"} success:^(NSURLSessionDataTask *task, id responseObject, NSString *JSONString) {
                NSLog(@"%@",JSONString);
            }];
        }];
    }
    return _button1;
}

- (void)bcpInitView {
    [super bcpInitView];
    [self.view addSubview:self.button];
    [self.view addSubview:self.button1];
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
