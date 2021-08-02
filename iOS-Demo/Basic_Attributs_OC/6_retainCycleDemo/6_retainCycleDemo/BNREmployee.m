//
//  BNREmployee.m
//  6_retainCycleDemo
//
//  Created by Sophia Fez on 2020/12/7.
//

#import "BNREmployee.h"

@implementation BNREmployee
- (void)employee {
    __weak BNREmployee *weakSelf = self; // 弱引用指针

    void (^myBlock)(void) = ^(){
        BNREmployee *innerSelf = weakSelf; // 局部强引用
        NSLog(@"Employee: %@", innerSelf);
    };
    myBlock();
}

@end
