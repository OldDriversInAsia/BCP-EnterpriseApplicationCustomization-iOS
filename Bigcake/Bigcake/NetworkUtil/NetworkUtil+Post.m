//
//  NetworkUtil+Post.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "NetworkUtil+Post.h"

@implementation NetworkUtil (Post)

+ (void)POSTPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(NSURLSessionDataTask *, id, NSString *))success {
    [NetworkUtil requestPath:path parameters:parameters success:success failure:nil showText:@"" showViewController:nil checkOut:NO scrollView:nil requsetType:RequsetTypePOST];
}

@end
