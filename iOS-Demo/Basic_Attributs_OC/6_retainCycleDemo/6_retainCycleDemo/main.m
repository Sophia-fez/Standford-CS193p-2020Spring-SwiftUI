//
//  main.m
//  6_retainCycleDemo
//
//  Created by Sophia Fez on 2020/12/7.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNREmployee *Employee = [[BNREmployee alloc] init];
        [Employee employee];
    }
    return 0;
}
