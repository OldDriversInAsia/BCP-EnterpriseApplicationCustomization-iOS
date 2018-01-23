//
//  NetworkingInuse.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/22.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "NetworkingInuse.h"

@implementation NetworkingInuse

+ (NSArray *)needSetCookiePaths {
    [super needSetCookiePaths];
    return @[BCP_TEST];
}

@end
