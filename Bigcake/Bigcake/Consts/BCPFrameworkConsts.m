//
//  BCPFrameworkConsts.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString* nullableStr(NSString *str) {
    if ([NSStringFromClass([str class]) containsString:@"String"]) {
        if (str.length > 0) {
            return str;
        }
    }
    return @"";
}
