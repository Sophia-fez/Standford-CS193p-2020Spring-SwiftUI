//
//  NSObject+Delegate.m
//  3_categoryDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import "NSObject+Delegate.h"

@implementation NSObject (Delegate)

- (NSString *) delegate_example {
    NSLog(@"I am delegate delegate_example");
    NSString *str = @"delegate NSObject+Delegate called Informal Protocol.";
    return str;
}

@end
