//
//  MyProtocol.h
//  3_categoryDemo
//
//  Created by Sophia Fez on 2020/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 遵守其他的协议，这里是遵守了NSObject协议，定义协议的关键字是@protocol
@protocol MyProtocol <NSObject>

// 默认是需要实现的
- (void)test1;

// required需要实现，不实现会发出警告
@required
- (void)test2;

// optional可以不实现
@optional
- (void)test3;

@end

NS_ASSUME_NONNULL_END
