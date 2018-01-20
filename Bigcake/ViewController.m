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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"ok" forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor cyanColor]];
        [_button setFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 100)];
        [_button setCenterX:HALF_OF(kScreenWidth)];
        [_button setCenterY:kScreenHeight * 0.8];
    }
    return _button;
}

- (void)bcpInitView {
    [super bcpInitView];
    [self.view addSubview:self.button];
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
