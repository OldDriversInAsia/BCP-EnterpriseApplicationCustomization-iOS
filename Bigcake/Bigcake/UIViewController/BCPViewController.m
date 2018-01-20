//
//  BCPViewController.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/19.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "BCPViewController.h"

@interface BCPViewController ()

@end

@implementation BCPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bcpInitUI];
    [self bcpInitView];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear");
}

- (void)bcpInitView {
    NSLog(@"BCPInitView");
    [self.view setBackgroundColor:[UIColor whiteColor]];
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
