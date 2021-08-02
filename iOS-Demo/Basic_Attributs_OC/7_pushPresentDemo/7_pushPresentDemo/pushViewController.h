//
//  pushViewController.h
//  7_pushPresentDemo
//
//  Created by Sophia Fez on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import "textFieldDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface pushViewController : UIViewController
@property (nonatomic, weak) NSObject<textFieldDelegate> *delegate;
@property (nonatomic) UITextField *textField;

- (void)save;

@end

NS_ASSUME_NONNULL_END
