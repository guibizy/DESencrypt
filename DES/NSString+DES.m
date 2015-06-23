//
//  NSString+DES.m
//  UMC
//
//  Created by 悦讯科技  on 13-7-23.
//  Copyright (c) 2013年 shihui. All rights reserved.
//

#define KEY @"fsgfscdr" // 必须是8位字符串

#import "NSString+DES.h"

#import "NSData+Base64Data.h"
#import "NSString+Base64String.h"
#import "Define.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (DES)

// 字符串加密
- (NSString *)stringWithStrToDES {
    if (self == nil || [self isEqualToString:@"null"] || [self isEqualToString:@""] || (NSNull *)self == [NSNull null]) {
        return @"";
    }
    return [self encryptUseDES:self key:KEY];
}

// 字符串解密
- (NSString *)stringWithDESToStr {
    if (self == nil || [self isEqualToString:@"null"] || [self isEqualToString:@""] || (NSNull *)self == [NSNull null]) {
        return @"";
    }
    return [self decryptUseDES:self key:KEY];
}

#pragma mark -

static Byte iv[] = {1,2,3,4,5,6,7,8};

- (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key {
    
    NSString *ciphertext = nil;
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [textData bytes]  , [textData length],
                                          buffer, 1024,
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext = [data base64Encoding];
    }
    
    return ciphertext;
}

- (NSString *)decryptUseDES:(NSString *)plainText key:(NSString *)key {
    
    NSString *ciphertext = nil;
    NSData *textData = [plainText Base64Str2Data];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [textData bytes]  , [textData length],
                                          buffer, 1024,
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
#if ! __has_feature(objc_arc)
        ciphertext = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]autorelease];
#else
        ciphertext = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
#endif
    }else{
        DMLog(@"DES解密失败");
    }
    
    return ciphertext;
}

@end
