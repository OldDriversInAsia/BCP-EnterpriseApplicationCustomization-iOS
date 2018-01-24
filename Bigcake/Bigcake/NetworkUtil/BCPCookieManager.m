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

+ (void)clear {
    [[BCPCookieManager shareManager] setCookie:@""];
}

+ (void)setManager {
    NSString *cookiesString = [[BCPCookieManager shareManager] cookie];
    [[[NetworkUtil shareManager] requestSerializer] setValue:cookiesString forHTTPHeaderField:@"cookie"];
    [[[NetworkUtil shareManager] requestSerializer] setHTTPShouldHandleCookies:YES];
}

+ (void)save {
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:APIBASE]];
    NSMutableArray *cookiesStringArray = [NSMutableArray array];
    for (NSHTTPCookie *cookie in cookies) {
        [cookiesStringArray addObject:cookie.name.append(@"=").append(cookie.value)];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
    NSString *cookiesString = [cookiesStringArray componentsJoinedByString:@"; "];
    if ([cookiesString containsString:BCP_SSO]) {
        [[BCPCookieManager shareManager] setCookie:cookiesString];
    }else {
//        [BCPCookieManager clear];
    }
}

@end
