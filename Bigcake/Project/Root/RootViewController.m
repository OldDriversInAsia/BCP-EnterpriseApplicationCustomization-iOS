//
//  RootViewController.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/29.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.创建标签控制器
//    UITabBarController *tab = [[UITabBarController alloc]init];
    
    //2.创建相应的子控制器（viewcontroller）
    LoginViewController *firstVC = [LoginViewController new];
    firstVC.navigationItem.title = @"-登录-";
    UINavigationController *firstNC = [[UINavigationController alloc]initWithRootViewController:firstVC];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:@"登录测试" image:nil selectedImage:nil];
    [firstNC setTabBarItem:firstItem];
    
    
    LoginViewController *secondVC = [LoginViewController new];
    secondVC.navigationItem.title = @"-注册-";
    UINavigationController *secondNC = [[UINavigationController alloc]initWithRootViewController:secondVC];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTitle:@"注册测试" image:nil selectedImage:nil];
    [secondNC setTabBarItem:secondItem];
    
    
    //3.添加到控制器
    //特别注意：管理一组的控制器(最多显示五个,多余五个的话,包括第五个全部在更多模块里面,并且可以通过拖拽方式进行顺序编辑);
    NSArray *array = @[firstNC,secondNC];
    self.viewControllers = array;
    //我们在实际操作过程中还可以根据taBar的属性，标签栏的颜色、风格、文字颜色等等
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
