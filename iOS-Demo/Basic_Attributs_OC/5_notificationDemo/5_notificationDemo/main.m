//
//  main.m
//  5_notificationDemo
//
//  Created by Sophia Fez on 2020/12/7.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一个BNRLogger实例logger，让它成为NSTimer的目标，将它的动作设置为updateLastTime
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        // 将BNRLogger注册为观察者，在系统的时区发生变化时收到相应的通知
        [[NSNotificationCenter defaultCenter]
                                addObserver:logger
                                    selector:@selector(zoneChange:)
                                    name:NSSystemTimeZoneDidChangeNotification
                                    object:nil];
        
        __unused  NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        selector:@selector(updateLastTime:)
                                                        userInfo:nil
                                                         repeats:YES];
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
