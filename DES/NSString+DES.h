//
//  NSString+DES.h
//  UMC
//
//  Created by 悦讯科技  on 13-7-23.
//  Copyright (c) 2013年 shihui. All rights reserved.
//

// des加密解密类

// --- mode 加密解密时使用

#define DES_TO_STR(string) \
if(string.length!=0) string = [string stringWithDESToStr]; \
else string = @"";

#import <Foundation/Foundation.h>

@interface NSString (DES)

// 字符串加密
- (NSString *)stringWithStrToDES;

// 字符串解密
- (NSString *)stringWithDESToStr;

@end
