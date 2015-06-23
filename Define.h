//
//  Define.h
//  UMC
//
//  Created by 悦讯科技  on 13-8-20.
//  Copyright (c) 2013年 shihui. All rights reserved.
//


/*
 __LINE__：在源代码中插入当前源代码行号；
 
 __FILE__：在源文件中插入当前源文件名；
 
 __DATE__：在源文件中插入当前的编译日期
 
 __TIME__：在源文件中插入当前编译时间；
 
 __STDC__：当要求程序严格遵循ANSI C标准时该标识被赋值为1；
 
 __cplusplus：当编写C++程序时该标识符被定义。
 
 __PRETTY_FUNCTION__ : 当前方法块名称
 */


// 调试模式专用日志

#ifdef DEBUG
#define DMLog(...) NSLog(@"%@", [NSString stringWithFormat:__VA_ARGS__])
#define ERRORLog(...) NSLog(@"\n\n Error: \n method: %s \n file:   %s \n line:   %d \n %@ \n\n", __PRETTY_FUNCTION__,__FILE__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define DMLog(...) do { } while (0)
//#define ERRORLog(...) do { } while (0)
#define ERRORLog(...) NSLog(@"\n\n Error: \n method: %s \n file:   %s \n line:   %d \n %@ \n\n", __PRETTY_FUNCTION__,__FILE__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#endif




// 屏幕宽高
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// Window实例
#define WINDOW ([[UIApplication sharedApplication] keyWindow])


// 一像素高度
#define ONE_PX (1.0/([UIScreen mainScreen].scale * 1.0f))


// --- 判断当前屏幕是否是宽屏

#define screen_four_inch ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 获取系统版本
#define Device_Version [[[UIDevice currentDevice] systemVersion] floatValue]

#define UICOLOR_RGBA(a, b, c, d) [UIColor colorWithRed:a/255.0f green:b/255.0f blue:c/255.0f alpha:d]



#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface Define : NSObject

// 当前是否已经越狱
+ (Boolean)IsDeviceJailBroken;

// 当前是否运行在iPhone端
+ (Boolean)IsRunningOniPhone;

// 获取当前设备可用内存(单位：MB）
+ (double)availableMemory;

// 获取当前任务所占用的内存（单位：MB）
+ (double)usedMemory;

// 获取内部版本号
+ (double)getDoubleBundleVersion;
+ (NSString *)getBundleVersion;

// 计算textview高度
+ (CGFloat)getTextViewHeightWithLabel:(UILabel *)label mixHight:(CGFloat)mixHeight;
+ (CGFloat)getTextViewHeightWithMessage:(NSString *)message width:(float)width font:(UIFont *)font mixHight:(float)mix;
// 计算textview宽度
+ (CGFloat)getTextViewWidthWithLabel:(UILabel *)label mixWidth:(CGFloat)mixWidth;
+ (CGFloat)getTextViewWidthWithMessage:(NSString *)message font:(UIFont *)fontSize mixWidth:(float)mix;

// 给view增加圆角
+ (void)setBezierWithView:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

/**
 *  获取文件大小
 *
 *  @param size 文件大小，字节
 *
 *  @return 文件大小的显示用字符串
 */
+ (NSString *)getFileSize:(unsigned long long)length;

//邮箱
+ (BOOL)validateEmail:(NSString *)email;

// 0-9
+ (BOOL)isOne2Nine:(NSString *)text;

// 数字
+ (BOOL)isNumber:(NSString *)text;

+ (BOOL)RE:(NSString *)text reStr:(NSString *)regex;

@end
