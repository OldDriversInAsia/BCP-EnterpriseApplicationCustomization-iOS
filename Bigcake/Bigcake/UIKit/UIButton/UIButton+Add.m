//
//  UIButton+Add.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "UIButton+Add.h"

@implementation UIButton (Add)

- (void)addTapAction:(void (^)(id sender))action {
    [self setBlockForControlEvents:UIControlEventTouchUpInside block:action];
}

@end
