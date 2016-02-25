//
//  ViewController.m
//  SKWebViewDemo
//
//  Created by Apple on 16/2/25.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "SKWebTools.h"
#import "SKWebProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Class <SKWebProtocol> webViewControllerClass = [SKWebTools classForScheme:SK_MODULE_WEB_VC];
    UIViewController<SKWebProtocol> *webViewController = [webViewControllerClass webViewControllerForUrl:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self presentViewController:webViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
