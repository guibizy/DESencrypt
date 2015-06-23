//
//  NSData+Base64Data.m
//  UMC
//
//  Created by 悦讯 on 14-6-9.
//  Copyright (c) 2014年 shihui. All rights reserved.
//

#import "NSData+Base64Data.h"

#import "Base64Tool.h"

@implementation NSData (Base64Data)

- (NSString *)base64Encoding {
    return [Base64Tool base64EncodedStringFrom:self];
}

@end
