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
        [_button setFrame:CGRectMake(100, 100, 100, 100)];
    }
    return _button;
}

- (void)bcpInitView {
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
