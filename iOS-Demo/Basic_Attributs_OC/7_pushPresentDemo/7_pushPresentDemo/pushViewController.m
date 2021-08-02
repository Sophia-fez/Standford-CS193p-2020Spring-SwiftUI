//
//  pushViewController.m
//  7_pushPresentDemo
//
//  Created by Sophia Fez on 2020/12/9.
//

#import "pushViewController.h"
#import "HomeViewController.h"

@interface pushViewController ()

@end

@implementation pushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textField = [[UITextField alloc] init];
    [self createUI:_textField];
}

- (void)createUI:(UITextField *)textField {
    NSLog(@"pushView");
    textField.frame = CGRectMake(0, 100, self.view.frame.size.width, 50);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.backgroundColor = [UIColor grayColor];
    textField.placeholder = @"请输入内容";
    textField.font = [UIFont fontWithName:@"Arial" size:20.0f];
    textField.textColor = [UIColor whiteColor];
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.keyboardAppearance = UIKeyboardAppearanceDefault;
    [self.view addSubview:textField];
    
    UIButton *saveButton = [[UIButton alloc] init];
    saveButton.backgroundColor = [UIColor redColor];
    saveButton.frame = CGRectMake(150, 300, 100, 50);
    [saveButton setTitle:@"save" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
}

- (void)save{
    // 返回上一层页面时将值通过代理传回
    [self.delegate passValue:self.textField.text];
    NSLog(@"push: %@", self.textField.text);
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
