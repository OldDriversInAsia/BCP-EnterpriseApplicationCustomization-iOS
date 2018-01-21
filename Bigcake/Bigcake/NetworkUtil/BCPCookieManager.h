//
//  BCPCookieManager.h
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户登陆状态的 cookie name
 */
#define BCP_SSO        @"BCP_SSO"

@interface BCPCookieManager : NSObject

+ (BCPCookieManager *)shareManager;
- (NSString *)cookie;
- (void)set:(NSString *)cookie;
+ (NSString *)genCookieWith:(NSString *)cookie;

@end
