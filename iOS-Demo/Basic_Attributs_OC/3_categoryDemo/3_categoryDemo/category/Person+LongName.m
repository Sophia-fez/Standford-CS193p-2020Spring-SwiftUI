//
//  Person+LongName.m
//  3_categoryDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import "Person+LongName.h"

@implementation Person (LongName)

- (void)detialMore: (NSString *)name {
    if([name length] > 2) {
        NSLog(@"The too long name is: %@", name);
    } else {
        NSLog(@"The length of ’%@‘ meets the requirements.", name);
    }
    
}

@end
