//
//  NSString+Base64String.h
//  UMC
//
//  Created by 悦讯 on 14-6-9.
//  Copyright (c) 2014年 shihui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64String)

- (NSString *)str2Base64Str;

- (NSString *)Base64Str2Str;

- (NSData *)Base64Str2Data;

@end
