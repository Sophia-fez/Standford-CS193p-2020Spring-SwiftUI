//
//  BNRLogger.m
//  5_notificationDemo
//
//  Created by Sophia Fez on 2020/12/7.
//

#import "BNRLogger.h"

@implementation BNRLogger

- (NSString *)lastTimeString {
    static NSDateFormatter *dateFormatter = nil;
    if(!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer *)t {
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

- (void)zoneChange:(NSNotification *)note {
    NSLog(@"The system time zone has changed!");
}

@end
