//
//  Base64Tool.h
//  UMC
//
//  Created by 悦讯 on 14-6-9.
//  Copyright (c) 2014年 shihui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base64Tool : NSObject

// base64字符串转换成data
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;

// data转换成base64字符串
+ (NSString *)base64EncodedStringFrom:(NSData *)data;

@end
