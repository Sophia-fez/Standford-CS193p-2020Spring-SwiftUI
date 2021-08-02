//
//  HomeViewController.h
//  7_pushPresentDemo
//
//  Created by Sophia Fez on 2020/12/8.
//

#import <UIKit/UIKit.h>
#import "textFieldDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController<textFieldDelegate>
@property (nonatomic) UILabel *label;

@end

NS_ASSUME_NONNULL_END
