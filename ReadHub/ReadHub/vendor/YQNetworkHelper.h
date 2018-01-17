//
//  YQNetworkHelper.h
//  NsTab
//
//  Created by nickchen on 2018/1/17.
//  Copyright © 2018年 chenyuqiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 请求成功的Block
typedef void(^YQHttpRequestSuccess)(id responseObject);

/// 请求失败的Block
typedef void(^YQHttpRequestFailed)(NSError *error);

@interface YQNetworkHelper : NSObject

+ (void)cancelAllRequest;

+ (void)cancelRequestWithURL:(NSString *)URL;

+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                           success:(YQHttpRequestSuccess)success
                           failure:(YQHttpRequestFailed)failure;

+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                            success:(YQHttpRequestSuccess)success
                            failure:(YQHttpRequestFailed)failure;

/// 开启日志打印 (Debug级别)
+ (void)openLog;

/// 关闭日志打印,默认关闭
+ (void)closeLog;

@end
