//
//  BCPCookieManager.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "BCPCookieManager.h"

@interface BCPCookieManager ()

@property (nonatomic, copy) NSString *cookie;

@end

@implementation BCPCookieManager

+ (BCPCookieManager *)shareManager {
    static BCPCookieManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BCPCookieManager alloc] init];
    });
    return manager;
}

- (NSString *)cookie {
    return _cookie;
}

- (void)set:(NSString *)cookie {
    self.cookie = cookie;
}

- (void)clear {
    [self set:@""];
//    self.cookie = @"";
}

@end
