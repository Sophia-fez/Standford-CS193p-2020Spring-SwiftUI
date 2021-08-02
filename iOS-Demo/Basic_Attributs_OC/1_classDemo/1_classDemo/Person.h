//
//  Person.h
//  1_classDemo
//
//  Created by Sophia Fez on 2020/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 实例变量的名字以_开始，区别于局部变量
// 类Person遵循基协议NSObject
@interface Person : NSObject{
    NSString *_name;
    int _idNumber;
    int _gender;
}

// get和set实例变量的方法，get方法名即去掉实例变量的下划线，set方法使用驼峰法命名
- (NSString *)name;
- (void)setName: (NSString *)name;
- (int)idNumber;
- (void)setIdNumber: (int)idNumber;
- (int)gender;
- (void)setGender: (int)gender;

// -表示对象方法（动态方法）用对象名调用，+表示类方法（静态方法）用类名调用


// 自定义函数：输出个人信息
- (void)printMessage: (NSString *)name andIdNumber:(int)idNumber andGender:(int)gender;

// 一个冒号:对应一个参数；而且冒号也是方法的一部分;多个参数之间可以使用andxx连接,也可以不写

@end

NS_ASSUME_NONNULL_END
