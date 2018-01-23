//
//  BCPLayoutConsts.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>

CGFloat fixValue(CGFloat value) {
    if (ceil(value) - value > 0.75) {
        return floor(value);
    } else if (ceil(value) - value > 0.25) {
        return floor(value) + 0.5;
    } else {
        return ceil(value);
    }
}

CGFloat half_of(CGFloat value) {
    return (fixValue((value) / (2.f)));
}
