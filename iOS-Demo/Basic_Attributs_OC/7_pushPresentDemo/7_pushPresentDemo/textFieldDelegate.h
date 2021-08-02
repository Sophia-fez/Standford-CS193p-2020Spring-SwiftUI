//
//  textFieldDelegate.h
//  7_pushPresentDemo
//
//  Created by Sophia Fez on 2020/12/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol textFieldDelegate <NSObject>
- (void)passValue:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
