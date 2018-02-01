//
//  LoginView.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/27.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()

@end

@implementation LoginView

- (void)initView {
    [super initView];
    [self addSubview:self.clear];
    [self addSubview:self.test];
    [self addSubview:self.login];
    [self addSubview:self.textView];
    
    [self.clear setCenterX:half_of(kScreenWidth)];
    [self.clear setCenterY:kScreenHeight * 0.8];
    [self.test setBottom:self.clear.top - 10];
    [self.test setCenterX:half_of(kScreenWidth)];
    [self.login setBottom:self.test.top - 10];
    [self.login setCenterX:half_of(kScreenWidth)];
    [self.textView setBottom:self.login.top - 10];
    [self.textView setCenterX:half_of(kScreenWidth)];
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 100)];
        [_textView setTextColor:[UIColor blueColor]];
    }
    return _textView;
}

- (UIButton *)login {
    if (!_login) {
        _login = [UIButton buttonWithType:UIButtonTypeSystem];
        [_login setTitle:@"login" forState:UIControlStateNormal];
        [_login setBackgroundColor:[UIColor cyanColor]];
        [_login setFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 60)];
        @weakify(self);
        [_login addTapAction:^(id sender) {
            [NetworkUtil POSTPath:BCP_LOGIN parameters:@{@"loginName":@"lidada1",@"password":@"123456"} success:^(NSURLSessionDataTask *task, id responseObject, NSString *JSONString) {
                [self_weak_.textView setText:JSONString];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self_weak_.textView setText:@""];
                });
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
        [_test setFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 60)];
        @weakify(self);
        [_test addTapAction:^(id sender) {
            [NetworkUtil GETPath:BCP_TEST parameters:@{@"param":@"Hello,world!"} success:^(NSURLSessionDataTask *task, id responseObject, NSString *JSONString) {
                [self_weak_.textView setText:JSONString];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self_weak_.textView setText:@""];
                });
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
        [_clear setFrame:CGRectMake(0, 0, kScreenWidth * 0.8, 60)];
        
        [_clear addTapAction:^(id sender) {
            [BCPCookieManager clear];
        }];
    }
    return _clear;
}

@end
