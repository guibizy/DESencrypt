//
//  NSString+Base64String.m
//  UMC
//
//  Created by 悦讯 on 14-6-9.
//  Copyright (c) 2014年 shihui. All rights reserved.
//

#import "NSString+Base64String.h"

#import "Base64Tool.h"

@implementation NSString (Base64String)

- (NSString *)str2Base64Str {
    return [Base64Tool base64EncodedStringFrom:[self dataUsingEncoding:NSUTF8StringEncoding]];
}

- (NSString *)Base64Str2Str {
    return [[NSString alloc] initWithData:[Base64Tool dataWithBase64EncodedString:self] encoding:NSUTF8StringEncoding];
}

- (NSData *)Base64Str2Data {
    return [Base64Tool dataWithBase64EncodedString:self];
}

@end
