//
//  SKWebViewController.m
//  SKWebViewDemo
//
//  Created by Apple on 16/2/25.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "SKWebViewController.h"
#import "SKWebTools.h"

@interface SKWebViewController ()
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NSURL *url;
@end

@implementation SKWebViewController
+ (void)load {
    if (SK_iOSVersion < WK_WEBKIT_IOS_VERSION) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [SKWebTools registerScheme:SK_MODULE_WEB_VC forClass:[self class]];
        });
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    [self loadRequest];
}

- (void)loadRequest {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
    
    NSLog(@"You are using UIWebView");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SKWebProtocol
+ (instancetype)webViewControllerForUrl:(NSURL *)url {
    SKWebViewController *webVC = [[SKWebViewController alloc] init];
    webVC.url = [url copy];
    return webVC;
}

@end
