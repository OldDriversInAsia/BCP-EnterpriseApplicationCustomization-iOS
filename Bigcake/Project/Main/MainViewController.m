//
//  MainViewController.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/12.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@interface MainViewController ()

@property (nonatomic, strong) MainView *mainView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (MainView *)mainView {
    if (!_mainView) {
        _mainView = [[MainView alloc] init];
        [_mainView setFrame:self.view.bounds];
        [_mainView initView];
    }
    return _mainView;
}

- (void)bcpInitView {
    [super bcpInitView];
    [self.view addSubview:self.mainView];
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
