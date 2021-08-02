//
//  Person.h
//  2_propertyDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

NS_ASSUME_NONNULL_BEGIN

// 实例变量的名字以_开始，区别于局部变量
// 类Person遵循基协议NSObject
// Person类有三个属性，声明属性编译器会自动声明并实现存取方法
// atomic nonatomic和多线程运行有关，默认是readwirte，还有readonly，当声明一个指向NSString或NSArray对象的属性时，都需要设置copy属性
// 可以同时遵守多个协议<MyProtocol1, MyProtocol2>
@interface Person : NSObject <MyProtocol>
@property (nonatomic, readwrite) NSString *name;
@property (nonatomic) int idNumber;
@property (nonatomic) int gender;

@property (nonatomic) float height;
@property (nonatomic) float weight;
@property (nonatomic, readonly) float bmi;

// 计算BMI
- (float)bmi;

// 打印个人信息
- (void)printMessage;

@end

NS_ASSUME_NONNULL_END
