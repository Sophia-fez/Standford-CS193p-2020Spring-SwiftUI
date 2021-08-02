//
//  main.m
//  1_classDemo
//
//  Created by Sophia Fez on 2020/12/2.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    // 创建Person实例
    // alloc是类方法（静态方法），这里返回分配好内存的Person对象（person指向这个对象）
    // init是对象方法（动态方法），这里是person变量调用的，返回初始化完毕的对象再次复制给person
    Person *person = [[Person alloc] init];
    
    // oc的方法调用是使用中括号[ ],方法调用者写在括号左侧(如Person)，方法名写在括号右侧(如alloc)
    
    // 使用setter方法为实例变量赋值
    [person setName: @"Alice"];
    [person setIdNumber: 1];
    [person setGender: 0];
    
    // 使用getter方法获取实例变量的值
    NSString *name = [person name];
    int idNumber = [person idNumber];
    int gender = [person gender];
    
    // 使用自定义方法打印message
    [person printMessage:name andIdNumber:idNumber andGender:gender];
    // [person printMessage:[person name] andIdNumber:[person idNumber] andGender:[person gender]];
    
    return 0;
}
