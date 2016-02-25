//
//  SKWebTools.m
//  SKWebViewDemo
//
//  Created by Apple on 16/2/25.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "SKWebTools.h"

static SKWebTools *sharedInstance = nil;

@interface SKWebTools ()
@property (nonatomic, strong) NSMapTable *mapTable;
@end

@implementation SKWebTools

+ (void)initialize {
    [self sharedInstance];
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mapTable = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsWeakMemory];
    }
    return self;
}

- (void)addScheme:(nonnull NSString *)scheme forClass:(nonnull Class)aClass {
    [self.mapTable setObject:aClass forKey:[scheme stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
}
@end

#pragma mark - Register
@implementation SKWebTools (Register)

+ (void)registerScheme:(nonnull NSString *)scheme
              forClass:(nonnull Class)aClass {
    NSParameterAssert(scheme);
    NSParameterAssert(aClass);
    
    if ([self classForScheme:scheme]) {
        [NSException raise:@"Scheme Already Exists"
                    format:@"'%@' Scheme Already Exists", scheme];
        return;
    }
    if (![aClass isSubclassOfClass:[NSObject class]]) {
        [NSException raise:@"Wrong Class Type"
                    format:@"Class should inherit from NSObject"];
        return;
    }
    if ([scheme isEqualToString:@""]) {
        [NSException raise:@"Scheme Wrong"
                    format:@"Scheme should not be blank"];
        return;
    }
    [sharedInstance addScheme:scheme forClass:aClass];
}

@end

#pragma mark - Mapping

@implementation SKWebTools (Mapping)

+ (nullable Class)classForScheme:(nonnull NSString *)scheme {
    return [sharedInstance.mapTable objectForKey:scheme];
}

+ (nullable instancetype)instanceForClassScheme:(nonnull NSString *)classScheme {
    Class aClass = [self classForScheme:classScheme];
    
    if (!aClass) return nil;
    
    return [[aClass alloc] init];
    
}

@end