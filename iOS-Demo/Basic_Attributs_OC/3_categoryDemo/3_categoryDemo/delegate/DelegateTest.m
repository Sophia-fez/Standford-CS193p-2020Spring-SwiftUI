//
//  delegateTest.m
//  3_categoryDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import "DelegateTest.h"
#import "NSObject+Delegate.h"

@implementation DelegateTest

// 类delegateTest委托category delegate帮助自己完成工作
// 类必须遵循某个正式或非正式的协议，然后把自己的self指针指派给委托
NSString *str;
- (NSString *)test {
    NSLog(@"I am class delegateTest, and I order category NSObject+Delegate to do something.");
    
    NSString *str = [NSString stringWithFormat:@"%@",[self delegate_example]];
    return str;
}

@end
