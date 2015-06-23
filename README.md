# DES加密解密
# 在需要加密解密的地方加
```Objective-c
#import "NSString+DES.h"
#import "NSData+Base64Data.h"
#import "NSString+Base64String.h"
```
直接使用，例子：
```Objective-c
self.strLab.text = [self.textField.text stringWithStrToDES];
self.desLab.text = [self.strLab.text stringWithDESToStr];
```
