//
//  NetworkUtil.m
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#import "NetworkUtil.h"
#import "BCPNetworkConst.h"
#import "BCPCookieManager.h"
#import "BCPFrameworkConsts.h"

@interface NetworkUtil ()

@property (nonatomic, copy) void (^networkReachabilityStatusBlock)(AFNetworkReachabilityStatus status);

@end

@implementation NetworkUtil

+ (void)requestPath:(NSString *)path
         parameters:(NSDictionary *)parameters
            success:(void (^)(NSURLSessionDataTask * task , NSDictionary* responseObject , NSString *JSONString))success
            failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure
           showText:(NSString *)showText
 showViewController:(UIViewController *)showViewController
           checkOut:(BOOL)isCheckout
         scrollView:(UIScrollView *)scrollView
        requsetType:(RequsetType)type {
    //    if (![self handleReachable:scrollView showViewController:showViewController]) {
    //        return;
    //    }
    //    if ([self neetAuthorization:path]) {
    //        return;
    //    }
    //    [self setCookie:[self shareManager]];
    //    [self showProgressHUDWhenScrollViewFirstRequest:scrollView showText:showText showViewController:showViewController];
    parameters = [self commonParameters:parameters scrollView:scrollView];
    void (^requestSuccess)(NSURLSessionDataTask * task , NSDictionary* responseObject ) = ^(NSURLSessionDataTask * task , NSDictionary* responseObject) {
        [self handleRequestSuccessPath:path parameters:parameters task:task responseObject:responseObject showViewController:showViewController checkOut:isCheckout scrollView:scrollView success:success];
    };
    
    void (^requestfailure)(NSURLSessionDataTask * task, NSError * error) = ^(NSURLSessionDataTask * task, NSError * error) {
        [self handleRequestFailedPath:path task:task error:error showViewController:showViewController scrollView:scrollView failure:failure];
    };
    if (type == RequsetTypeGET) {
        [[self shareManager] GET:path parameters:parameters progress:nil success:requestSuccess failure:requestfailure];
    } else if (type == RequsetTypePOST) {
        [[self shareManager] POST:path parameters:parameters progress:nil success:requestSuccess failure:requestfailure];
    } else if (type == RequsetTypePUT) {
        [[self shareManager] PUT:path parameters:parameters success:requestSuccess failure:requestfailure];
    }
}

+ (void)handleRequestSuccessPath:(NSString *)path
                      parameters:(NSDictionary *)parameters
                            task:(NSURLSessionDataTask *)task
                  responseObject:(NSDictionary *)responseObject
              showViewController:(UIViewController *)showViewController
                        checkOut:(BOOL)isCheckout
                      scrollView:(UIScrollView *)scrollView
                         success:(void (^)(NSURLSessionDataTask * task , NSDictionary* responseObject , NSString *JSONString))success {
    //    [scrollView setFirstRequest:NO];
    //
    //    [self checkUserInfoComplete:path parameters:parameters responseObject:responseObject];
    //    /**
    //     *  可添加错误状态拦截
    //     */
    //    if (scrollView) {
    //        if ((scrollView.start == 0 && !scrollView.startIdKeyPath) || scrollView.isRefreshData) {
    //            [scrollView.data removeAllObjects];
    //        }
    //        [scrollView setRefreshData:NO];
    //        [scrollView.mj_header endRefreshing];
    //        [scrollView.mj_footer endRefreshing];
    //    }
    //    BaseModel *baseModel = [BaseModel objectFromJSON:responseObject];
    //    if (baseModel.status == CODE_SUCCESS && [self isSetCookiePath:path]) {
    //        [self saveCookie:[self shareManager]];
    //    }
    //    if ((isCheckout && baseModel.status == CODE_SUCCESS) || !isCheckout) {
            success(task, responseObject, [self getJSONString:responseObject]);
    //    } else {
    //        NSLog(@"%@", responseObject);
    //        showAlert(baseModel.msg)
    //    }
    //    [showViewController hideProgressHUD];
}

+ (void)handleRequestFailedPath:(NSString *)path
                           task:(NSURLSessionDataTask *)task
                          error:(NSError *)error
             showViewController:(UIViewController *)showViewController
                     scrollView:(UIScrollView *)scrollView
                        failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure {
    //    if (scrollView) {
    //        [scrollView setRefreshData:NO];
    //        [scrollView.mj_header endRefreshing];
    //        [scrollView.mj_footer endRefreshing];
    //    }
    //    NSString *errorUserInfo = ((NSError *)error.userInfo[@"NSUnderlyingError"]).userInfo[@"NSLocalizedDescription"];
    //    [self onRequestFaied:errorUserInfo];
    //    if (failure) {
    //        failure(task, error);
    //    }
    //    [showViewController hideProgressHUD];
    //    NSLog(@"%@", error);
}

+ (AFHTTPSessionManager *)shareManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:APIBASE]];
        NSMutableSet *acceptableContentTypesSet = [NSMutableSet set];
        [acceptableContentTypesSet addObject:@"application/json"];
        [acceptableContentTypesSet addObject:@"text/json"];
        [acceptableContentTypesSet addObject:@"text/javascript"];
        [acceptableContentTypesSet addObject:@"text/html"];
        [acceptableContentTypesSet addObject:@"text/xml"];
        [acceptableContentTypesSet addObject:@"text/plain"];
        [acceptableContentTypesSet addObject:@"application/x-www-form-urlencoded"];
        manager.responseSerializer.acceptableContentTypes = acceptableContentTypesSet;
        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"Request-By"];
    });
    return manager;
}












- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"BCPNetwork init");
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkReachabilityStatusChanged:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    }
    return self;
}

- (void)setNetworkReachabilityCallBack:(void (^)(BOOL))networkReachabilityCallBack {
    if ([[self class] isReachable]) {
        if (networkReachabilityCallBack) {
            networkReachabilityCallBack(YES);
        }
    } else {
        [self setNetworkReachabilityStatusBlock:^(AFNetworkReachabilityStatus status) {
            if (networkReachabilityCallBack) {
                networkReachabilityCallBack(status == AFNetworkReachabilityStatusReachableViaWWAN ||
                                            status == AFNetworkReachabilityStatusReachableViaWiFi);
            }
        }];
    }
}

- (void)networkReachabilityStatusChanged:(NSNotification *)notification {
    if (self.networkReachabilityStatusBlock) {
        self.networkReachabilityStatusBlock([[notification.userInfo objectForKey:AFNetworkingReachabilityNotificationStatusItem] integerValue]);
    }
}

+ (BOOL)isReachable {
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}

+ (AFNetworkReachabilityStatus)networkReachabilityStatus {
    return [[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus];
}

+ (void)setCookie:(AFHTTPSessionManager *)manager {
    NSString *cookiesString = [[BCPCookieManager shareManager] cookie];
    [manager.requestSerializer setHTTPShouldHandleCookies:YES];
    [manager.requestSerializer setValue:cookiesString forHTTPHeaderField:@"cookie"];
}

+ (void)saveCookie:(AFHTTPSessionManager *)manager {
    NSString *cookiesString = [[BCPCookieManager shareManager] cookie];
    if (!cookiesString.length) {
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:APIBASE]];
        NSMutableArray *cookiesStringArray = [NSMutableArray array];
        for (NSHTTPCookie *cookie in cookies) {
            [cookiesStringArray addObject:append3(cookie.name, @"=", cookie.value)];
        }
        cookiesString = [cookiesStringArray componentsJoinedByString:@"; "];
        if ([cookiesString containsString:BCP_SSO]) {
//            [SharedFrameworksHelper.user setCookie:cookiesString];
//            [SharedFrameworksHelper.user save];
        }
    }
}

+ (NSArray *)neetAuthorizationPaths {
    return nil;
}

+ (BOOL)neetAuthorization:(NSString *)currentPath {
//    BOOL isNeetAuthorization = NO;
//    for (NSString *path in [self neetAuthorizationPaths]) {
//        if ([currentPath containsString:path]) {
//            isNeetAuthorization = YES;
//            break;
//        }
//    }
//    return isNeetAuthorization && !SharedFrameworksHelper.user.cookie;
    return YES;
}

/**
 * 清空线程池
 */
+ (void)requestPathWithCancelAllOperations:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(NSURLSessionDataTask * task , id responseObject , NSString *JSONString))success showViewController:(UIViewController *)showViewController requsetType:(RequsetType)type {
    [[[self shareManager] operationQueue] cancelAllOperations];
    [self requestPath:path parameters:parameters success:success failure:nil showText:nil showViewController:showViewController checkOut:YES scrollView:nil requsetType:type];
}













+ (BOOL)handleReachable:(UIScrollView *)scrollView showViewController:(UIViewController *)showViewController {
//    if (![self isReachable] && [self networkReachabilityStatus] != AFNetworkReachabilityStatusUnknown) {
//        if (!SharedFrameworksHelper.isShowingNoConnectAlert) {
//            [SharedFrameworksHelper setShowingNoConnectAlert:YES];
//        }
//        if (scrollView) {
//            [scrollView setStart:0];
//            [scrollView.mj_footer endRefreshing];
//            [scrollView.mj_header endRefreshing];
//        }
//        [showViewController forceHideProgressHUD];
//        return NO;
//    }
    return YES;
}

+ (void)showProgressHUDWhenScrollViewFirstRequest:(UIScrollView *)scrollView showText:(NSString *)showText showViewController:(UIViewController *)showViewController {
//    if (!scrollView || scrollView.isFirstRequest) {
//        [showViewController showProgressHUD:showText];
//    }
}



+ (NSArray *)needSetCookiePaths {
    return nil;
}

+ (BOOL)isSetCookiePath:(NSString *)currentPath {
    NSArray *paths = [self needSetCookiePaths];
    BOOL isSetCookiePath = NO;
    for (NSString *path in paths) {
        if ([currentPath containsString:path]) {
            isSetCookiePath = YES;
            break;
        }
    }
    return isSetCookiePath;
}















+ (void)onRequestFaied:(NSString *)errorUserInfo {
//    if ([errorUserInfo containsString:@"403"]) {
//        [CSIMUtil disconnect:NO];
//        if (!SharedFrameworksHelper.isShowTokenInvalidateAlert) {
//            [SharedFrameworksHelper setShowTokenInvalidateAlert:YES];
//            [CommonAlertUtil alertNoPermission:^(NSInteger index) {
//                [SharedFrameworksHelper setShowTokenInvalidateAlert:NO];
//                if (index) {
//                    [ModelUser clear];
//                    SharedFrameworksHelper.needShowLoginCallBack(0);
//                }
//            }];
//        }
//    } else if ([errorUserInfo containsString:@"502"] ||
//               [errorUserInfo containsString:@"500"] ||
//               [errorUserInfo containsString:@"405"] ||
//               [errorUserInfo containsString:@"404"] ||
//               [errorUserInfo containsString:@"400"]) {
//        [self alertError:errorUserInfo];
//    } else {
//        [self alertError:errorUserInfo];
//    }
}

+ (void)alertError:(NSString *)errorUserInfo {
//    if (SharedFrameworksHelper.isShowingNoConnectAlert) {
//        return;
//    }
//    [SharedFrameworksHelper setShowingNoConnectAlert:YES];
//#if DEBUG    //    development
//    [CSAlertView alertWithContent:errorUserInfo leftButtonTitle:nil rightButtonTitle:@"确定" callBack:^(NSInteger index) {
//        [SharedFrameworksHelper setShowingNoConnectAlert:NO];
//    }];
//#else        //    production
//    [CommonAlertUtil alertNoConnect:^(NSInteger index) {
//        [SharedFrameworksHelper setShowingNoConnectAlert:NO];
//    }];
//#endif
}

+ (void)checkUserInfoComplete:(NSString *)path parameters:(NSDictionary *)parameters responseObject:(NSDictionary *)responseObject {
}

+ (NSDictionary *)commonParameters:(NSDictionary *)parameters scrollView:(UIScrollView *)scrollView {
    NSMutableDictionary *commonParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    if (scrollView) {
//        if (scrollView.isRefreshData) {
//            [scrollView setStart:0];
//        }
//        if (scrollView.startIdKeyPath) {
//            if (scrollView.data.count && !scrollView.isRefreshData) {
//                [commonParameters setValue:[scrollView.data.lastObject valueForKeyPath:scrollView.startIdKeyPath] forKey:KEY_NET_WORK_START_ID];
//            }
//        } else {
//            [commonParameters setValue:@(scrollView.start) forKey:KEY_NET_WORK_START];
//        }
//        [commonParameters setValue:@(scrollView.count) forKey:KEY_NET_WORK_COUNT];
    }
    return commonParameters;
}

+ (NSString *)getJSONString:(NSDictionary *)responseObject {
    if (responseObject) {
        return [[NSString alloc] initWithData: [NSJSONSerialization dataWithJSONObject:responseObject options:kNilOptions error:nil] encoding: NSUTF8StringEncoding];
    }
    return nil;
}

@end
