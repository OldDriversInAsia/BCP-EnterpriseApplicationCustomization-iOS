//
//  NSString+append.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/24.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "NSString+append.h"

@implementation NSString (append)

- (NSString *(^)(NSString *))append {
    return ^NSString *(NSString *aString) {
        return [self stringByAppendingString:nullableStr(aString)];
    };
}

- (NSString *(^)(NSString *, ...))appendFormat {
    return ^NSString *(NSString *format, ...) {
        va_list args;
        va_start(args, format);
        NSString *appendFormat = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        return self.append(appendFormat);
    };
}

- (NSArray<NSString *> *(^)(NSString *))separate {
    return ^NSArray *(NSString *separator) {
        return [self componentsSeparatedByString:separator];
    };
}

- (NSString *(^)(NSString *, NSString *))replace {
    return ^NSString *(NSString *target, NSString *replacement) {
        return [self stringByReplacingOccurrencesOfString:target withString:replacement];
    };
}

- (NSString *(^)(NSInteger))substringAt {
    return ^NSString *(NSInteger index) {
        return [self substringWithRange:NSMakeRange(index, 1)];
    };
}

@end
