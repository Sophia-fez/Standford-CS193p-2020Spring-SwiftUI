//
//  NSString+strExtend.m
//  3_categoryDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import "NSString+strExtend.h"

@implementation NSString (strExtend)

+ (NSString *)subStr:(NSString *)originalStr {
    return [originalStr length] < 5 ? @"超出最大长度":[originalStr substringWithRange:(NSMakeRange(0, 5))];
}

- (NSString *)subStr2 {
    return self.length < 5 ? @"超出最大长度":[self substringWithRange:(NSMakeRange(0, 5))];
}

@end
