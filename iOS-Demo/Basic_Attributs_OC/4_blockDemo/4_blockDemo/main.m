//
//  main.m
//  4_blockDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建两个数组对象，分别保存最初的字符串对象和去除元音字母后的吧版本
        NSArray *oldStrings = @[@"Sauekraut", @"Raygun", @"Big Nerd Banch", @"Mississippi"];
        NSLog(@"old strings: %@", oldStrings);
        NSMutableArray *newStrings = [NSMutableArray array];
        
        // 保存元音字母的数组，即要从字符串中移除的字符
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        // 声明block变量
        // void (^devowelizer)(id, NSUInteger, BOOL *);
        
        // 将block变量赋给变量，代码块存储的数据是一个函数体
        void (^devowelizer)(id, NSUInteger, BOOL *) = ^(id string, NSUInteger i, BOOL *stop) {
            NSRange yRange = [string rangeOfString:@"y" options:NSCaseInsensitiveSearch];
            
            // 是否包含字符串，如果包含则设置指针指向YES，终止枚举
            if(yRange.location != NSNotFound) {
                *stop = YES; // 执行完当前的block对象后终止枚举过程
                return;      // 结束当前正在执行的block对象
            }
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            // 枚举数组中的字符串，将所有的元音字母替换成空字符串
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                           options:NSCaseInsensitiveSearch
                                           range:fullRange];
            }
            
            [newStrings addObject:newString];
        };
        
        // 枚举数组对象，针对每个数组中的对象执行block对象devowelizer
        [oldStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"new strings: %@", newStrings);
    }
    return 0;
}
