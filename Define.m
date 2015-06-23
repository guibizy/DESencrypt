//
//  Define.m
//  UMC
//
//  Created by 悦讯科技  on 13-8-20.
//  Copyright (c) 2013年 shihui. All rights reserved.
//



#import "Define.h"

#import <sys/sysctl.h>
#import <mach/mach.h>

@implementation Define

#pragma mark - UIDevice

// 当前是否已经越狱
+ (Boolean)IsDeviceJailBroken
{
    BOOL jailbroken = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        jailbroken = YES;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        jailbroken = YES;
    }
    
    return jailbroken;
}

// 当前是否运行在iPhone端
+ (Boolean)IsRunningOniPhone
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

// 获取当前设备可用内存(单位：MB）
+ (double)availableMemory
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return ((vm_page_size *vmStats.free_count) / 1024.0) / 1024.0;
}

// 获取当前任务所占用的内存（单位：MB）
+ (double)usedMemory
{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    
    if (kernReturn != KERN_SUCCESS
        ) {
        return NSNotFound;
    }
    
    return taskInfo.resident_size / 1024.0 / 1024.0;
}

+ (double)getDoubleBundleVersion {
    double doubleCurrentVersion = [[Define getBundleVersion] doubleValue];
    
    return doubleCurrentVersion;
}

+ (NSString *)getBundleVersion {
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDict objectForKey:@"CFBundleVersion"];
    
    return currentVersion;
}

+ (CGFloat)getTextViewHeightWithLabel:(UILabel *)label mixHight:(CGFloat)mixHeight {
    return [self getTextViewHeightWithMessage:label.text width:label.frame.size.width font:label.font mixHight:mixHeight];
}
+ (CGFloat)getTextViewWidthWithLabel:(UILabel *)label mixWidth:(CGFloat)mixWidth {
    return [self getTextViewWidthWithMessage:label.text font:label.font mixWidth:mixWidth];
}

// 计算textview高度
+ (CGFloat)getTextViewHeightWithMessage:(NSString *)message width:(float)width font:(UIFont *)font mixHight:(float)mix {
    
    CGSize constraint = CGSizeMake(width, 20000.0f);
    
    // ios6
    //    CGSize size = [message sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    NSDictionary *dic = @{NSFontAttributeName:font};
    
    CGSize size = [message boundingRectWithSize:constraint
                                        options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                     attributes:dic
                                        context:nil].size;
    
    size.height = ceil(size.height);
    
    
    
    CGFloat height = MAX(size.height, mix);
    
    return height;
}

// 计算textview宽度
+ (CGFloat)getTextViewWidthWithMessage:(NSString *)message font:(UIFont *)font mixWidth:(float)mix {
    
    CGSize constraint = CGSizeMake(10000.0f, 10000.0f);
    
    // ios6
    //    CGSize size = [message sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    NSDictionary *dic = @{NSFontAttributeName:font};
    
    CGSize size = [message boundingRectWithSize:constraint
                                        options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                     attributes:dic
                                        context:nil].size;
    
    size.width = ceil(size.width);
    
    
    CGFloat width = MAX(size.width, mix);
    
    return width;
}

// 给view增加圆角
+ (void)setBezierWithView:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

+ (NSString *)getFileSize:(unsigned long long)length {
    NSString *fileSize = @"";
    if (length < 1024) {
        fileSize = [NSString stringWithFormat:@"%lldB",length];
    } else if (length / 1024 < 1024) {
        fileSize = [NSString stringWithFormat:@"%0.1fKB",(float)length/1024];
    } else if (length / (1024 * 1024) < 1024) {
        fileSize = [NSString stringWithFormat:@"%0.1fMB",(float)length / (1024 * 1024)];
    } else if (length / (1024 * 1024 * 1024) < 1024) {
        fileSize = [NSString stringWithFormat:@"%0.1fGB",(float)length / (1024 * 1024 * 1024)];
    } else {
        fileSize = [NSString stringWithFormat:@"%0.1fGB",(float)length / (1024 * 1024 * 1024)];
    }
    return fileSize;
}

// 邮箱
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [Define RE:email reStr:emailRegex];
}

// 0-9
+ (BOOL)isOne2Nine:(NSString *)text {
    NSString *numRegex = @"^[0-9]*$";
    return [Define RE:text reStr:numRegex];
}

// 数字
+ (BOOL)isNumber:(NSString *)text {
    NSString *numRegex = @"^[-+]?\\d+(\\.\\d+)?$";
    return [Define RE:text reStr:numRegex];
}

+ (BOOL)RE:(NSString *)text reStr:(NSString *)regex {
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTest evaluateWithObject:text];
}

@end
