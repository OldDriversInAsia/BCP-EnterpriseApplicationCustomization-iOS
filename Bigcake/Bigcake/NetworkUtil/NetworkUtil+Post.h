//
//  NetworkUtil+Post.h
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "NetworkUtil.h"

@interface NetworkUtil (Post)

+ (void)POSTPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(NSURLSessionDataTask * task , id responseObject , NSString *JSONString))success;

@end
