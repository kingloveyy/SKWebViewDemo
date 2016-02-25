//
//  SKWebProtocol.h
//  SKWebViewDemo
//
//  Created by Apple on 16/2/25.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SK_iOSVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define SK_MODULE_WEB_VC @"sk.module.web.vc"
/**
 *  WKWebView在哪个iOS 版本上开始使用
 */
#define WK_WEBKIT_IOS_VERSION 8.0

@protocol SKWebProtocol <NSObject>

+ (instancetype)webViewControllerForUrl:(NSURL *)url;

@end
