//
//  HomeViewController.m
//  7_pushPresentDemo
//
//  Created by Sophia Fez on 2020/12/8.
//

#import "HomeViewController.h"
#import "pushViewController.h"
#import "presentViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)passValue:(NSString *)string{
    self.label.text = string;
    NSLog(@"home: %@", string);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _label = [[UILabel alloc] init];
    _label.text = @"请点击按钮输入";
    [self createUI];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    
}

- (void)createUI {
    UIButton *pushButton = [[UIButton alloc] init];
    pushButton.frame = CGRectMake(150, 200, 100, 50);
    pushButton.backgroundColor = [UIColor yellowColor];
    [pushButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushButton setTitle:@"push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    UIButton *presentButton = [[UIButton alloc] init];
    presentButton.backgroundColor = [UIColor redColor];
    presentButton.frame = CGRectMake(150, 300, 100, 50);
    [presentButton setTitle:@"present" forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(presentEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
    _label.frame = CGRectMake(0, 400, self.view.frame.size.width, 50);
    _label.font = [UIFont systemFontOfSize:30];
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}

- (void)pushEvent {
    NSLog(@"You clicked pushButton!");
    pushViewController *pushView = [[pushViewController alloc] init];
    pushView.delegate = self; // 进入下一个页面时设置代理
    [self.navigationController pushViewController:pushView animated:YES];
}

- (void)presentEvent {
    NSLog(@"You clicked presentButton!");
    presentViewController *presentView = [[presentViewController alloc] init];
    presentView.delegate = self; // 进入下一个页面时设置代理
    [self.navigationController presentViewController:presentView animated:YES completion:nil];
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
