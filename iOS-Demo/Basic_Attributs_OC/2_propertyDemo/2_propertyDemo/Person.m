//
//  Person.m
//  2_propertyDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import "Person.h"
#import "MyProtocol.h"

@implementation Person

// 实现协议里声明的方法
- (void)test1 {
    NSLog(@"MyProtocol test1");
}

- (void)test2 {
    NSLog(@"MyProtocol test2");
}

// 声明属性编译器会自动声明并实现存取方法

// 计算BMI
- (float)bmi {
    return _weight / (_height * _height);
}

// 打印message
- (void)printMessage{
    NSArray *arr = @[@"his", @"her"];
    NSLog(@"%@ %@ idNumber is %d.", _name, arr[_gender], _idNumber);
}

@end
