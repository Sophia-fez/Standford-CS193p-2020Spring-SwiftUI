//
//  main.m
//  2_propertyDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+LongName.h"
#import "NSString+strExtend.h"
#import "MyProtocol.h"
#import "DelegateTest.h"

int main(int argc, const char * argv[]) {
    // 创建Person实例
    // alloc是类方法（静态方法），这里返回分配好内存的Person对象（person指向这个对象）
    // init是对象方法（动态方法），这里是person变量调用的，返回初始化完毕的对象再次复制给person
    Person *person = [[Person alloc] init];
    
    // 使用setter方法为实例变量赋值
    person.name = @"Alice";
    person.idNumber = 1;
    person.gender = 0;
    person.height = 1.8;
    person.weight = 96;
    
    // 使用getter方法获取实例变量的值
    NSString *name = person.name;
    int idNumber = person.idNumber;
    int gender = person.gender;
    float bmi = person.bmi; // readonly
    
    // 打印message
    [person printMessage];
    
    NSArray *arr = @[@"his", @"her"];
    NSLog(@"%@ %@ idNumber is %d, %@ BMI is %f.", name, arr[gender], idNumber, arr[gender], bmi);
    
    
    // category
    [person detialMore:name];
    
    NSLog(@"%@", [NSString subStr:@"abcdefghi"]);
    NSString *str = [@"abcdefghi" subStr2];
    NSLog(@"%@", str);
    
    // 测试protocol里的方法
    [person test1];
    [person test2];
    
    // delegate
    DelegateTest *delegateTest = [[DelegateTest alloc] init];
    NSLog(@"%@", delegateTest.test);
    
    return 0;
}

