//
//  UIButton+Add.h
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Add)

- (void)addTapAction:(void (^)(id sender))action;

@end
