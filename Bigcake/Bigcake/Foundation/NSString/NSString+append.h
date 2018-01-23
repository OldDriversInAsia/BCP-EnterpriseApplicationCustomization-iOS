//
//  NSString+append.h
//  Bigcake
//
//  Created by 武国斌 on 2018/1/24.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (append)

- (NSString *(^)(NSString *))append;
- (NSString *(^)(NSString *, ...))appendFormat;
- (NSArray<NSString *> *(^)(NSString *))separate;
- (NSString *(^)(NSString *, NSString *))replace;
- (NSString *(^)(NSInteger))substringAt;

@end
