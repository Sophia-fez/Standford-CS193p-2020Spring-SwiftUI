//
//  NSString+strExtend.h
//  3_categoryDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (strExtend)


// 字符串超出一定长度就返回特定的值(截取前n个字符)
// 静态方法
+ (NSString *)subStr:(NSString *)originalStr;

// 动态方法
- (NSString *)subStr2;

@end

NS_ASSUME_NONNULL_END
