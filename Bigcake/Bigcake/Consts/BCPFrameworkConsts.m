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

NSString* append(NSString *sf,NSString *ss) {
    return [NSString stringWithFormat:@"%@%@",nullableStr(sf),nullableStr(ss)];
}

NSString* append3(NSString *sf,NSString *ss,NSString *st) {
    NSString *result = [NSString stringWithFormat:@"%@%@%@",nullableStr(sf),nullableStr(ss),nullableStr(st)];
    return result;
}
