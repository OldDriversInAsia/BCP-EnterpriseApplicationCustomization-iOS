//
//  NetworkUtil.h
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, RequsetType) {
    RequsetTypeGET,
    RequsetTypePOST,
    RequsetTypePUT
};

@interface NetworkUtil : NSObject

+ (AFHTTPSessionManager *)shareManager;

/**
 *  set此回调之后，set时有网络可访问时直接回调并且 isReachable为 YES；
 *  如果 set时没有网络，那么等待网络状态发生改变而且可访问网络时会回调，并且 isReachable为 YES；
 */
- (void)setNetworkReachabilityCallBack:(void (^)(BOOL isReachable))networkReachabilityCallBack;

/**
 *  这个回调会在网络状态发生改变时回调；比如从无网络到有网络，或者有网络到无网络；
 *  如果从 set这个回调的时刻起一直有网络，那么这个回调不会执行，直到无网络；
 */
- (void)setNetworkReachabilityStatusBlock:(void (^)(AFNetworkReachabilityStatus status))networkReachabilityStatusBlock;

/**
 *  当前设备是否可联网
 */
+ (BOOL)isReachable;

+ (void)setCookie:(AFHTTPSessionManager *)manager;

/**
 *  未登录不能请求的接口
 *  子类重写或者在此写死
 *  如果当前请求的api包含于这些必须登陆才能访问的接口中，则当前设备如果没有登陆访问这个接口的话直接被拦截，不会调用这个接口
 */
+ (NSArray *)neetAuthorizationPaths;

/**
 *  搜索类网络请求
 *  清空线程池
 *
 */
+ (void)requestPathWithCancelAllOperations:(NSString *)path
                                parameters:(NSDictionary *)parameters
                                   success:(void (^)(NSURLSessionDataTask * task , id responseObject , NSString *JSONString))success
                        showViewController:(UIViewController *)showViewController
                               requsetType:(RequsetType)type;

/**
 *  基础请求
 *
 *  @param path                 URL
 *  @param parameters           参数
 *  @param success              请求成功回调
 *  @param failure              请求失败回调
 *  @param showText             指示器文字
 *  @param showViewController   指示器  父视图
 **
 *  校验 根据实际需求 修改
 *
 *  @param isCheckout 启用 校验
 *  @param scrollView 设置的scrollView
 *  @param type 请求类型 get／POST
 
 */
+ (void)requestPath:(NSString *)path
         parameters:(NSDictionary *)parameters
            success:(void (^)(NSURLSessionDataTask * task , NSDictionary* responseObject , NSString *JSONString))success
            failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure
           showText:(NSString *)showText
 showViewController:(UIViewController *)showViewController
           checkOut:(BOOL)isCheckout
         scrollView:(UIScrollView *)scrollView
        requsetType:(RequsetType)type;

/**
 *  子类重写，或者再此写死，需要 setCookie的 api数组
 */
+ (NSArray *)needSetCookiePaths;

/**
 *  获取用户信息的接口做判断
 *  如果用户信息不完整，则弹出补充用户信息的界面
 */
+ (void)checkUserInfoComplete:(NSString *)path parameters:(NSDictionary *)parameters responseObject:(NSDictionary *)responseObject;

/**
 *  添加通用的请求参数
 */
+ (NSDictionary *)commonParameters:(NSDictionary *)parameters scrollView:(UIScrollView *)scrollView;

/**
 *  请求失败的处理
 */
+ (void)onRequestFaied:(NSString *)errorUserInfo;

/**
 *  根据返回的NSDictionary 获取JSON字符串
 *
 *  @param responseObject responseObject
 *
 *  @return JSONString
 */
+ (NSString *)getJSONString:(NSDictionary *)responseObject;

@end

@interface NSObject (NetWorkUtil)

/**
 *  任何一个类都能获取 NetWorkUtil 实例；
 *  监听网络请求状态的变更；
 */
@property (nonatomic, strong) NetworkUtil *networkUtil;

@end

