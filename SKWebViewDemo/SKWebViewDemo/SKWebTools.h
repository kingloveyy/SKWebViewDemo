//
//  SKWebTools.h
//  SKWebViewDemo
//
//  Created by Apple on 16/2/25.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKWebTools : NSObject

@end

@interface SKWebTools (Register)

+ (void)registerScheme:(nonnull NSString *)scheme
              forClass:(nonnull Class)aClass;

@end

@interface SKWebTools (Mapping)

+ (nullable Class)classForScheme:(nonnull NSString *)scheme;
+ (nullable instancetype)instanceForClassScheme:(nonnull NSString *)classScheme;

@end