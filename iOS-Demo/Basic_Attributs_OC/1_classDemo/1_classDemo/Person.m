//
//  Person.m
//  1_classDemo
//
//  Created by Sophia Fez on 2020/12/2.
//

#import "Person.h"

@implementation Person

- (NSString *)name {
    return _name;
}

- (void)setName: (NSString *)name {
    _name = name;
}

- (int)idNumber {
    return _idNumber;
}

- (void)setIdNumber: (int)idNumber {
    _idNumber = idNumber;
}

- (int)gender {
    return _gender;
}

- (void)setGender: (int)gender {
    _gender = gender;
}

- (void)printMessage: (NSString *)name andIdNumber:(int)idNumber andGender:(int)gender{
    NSArray *arr = @[@"his", @"her"];
    NSLog(@"%@ %@ idNumber is %d.", name, arr[gender], idNumber);
}

@end
