//
//  ViewController.m
//  8_addChildVIew
//
//  Created by Sophia Fez on 2020/12/15.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIViewController *currentVC;

FirstViewController *first;
SecondViewController *second;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self controllerInit];
    [self currentVCInit];
    
    [self button];
}

- (void)controllerInit {
    first = [[FirstViewController alloc] init];
    [self addChildViewController:first];
    [first didMoveToParentViewController:self];
    [first.view setFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100)];
//    currentVC = first;
//    [self.view addSubview:currentVC.view];


    second = [[SecondViewController alloc] init];
    [self addChildViewController:second];
    [second didMoveToParentViewController:self];
    [second.view setFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100)];
}

- (void)currentVCInit {
    currentVC = [[UIViewController alloc] init];
    currentVC.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
    currentVC = first;
    [self.view addSubview:currentVC.view];
}


- (void)button {
    UIButton *firstButton = [[UIButton alloc] init];
    firstButton.backgroundColor = [UIColor orangeColor];
    firstButton.frame = CGRectMake(0, 50, 100, 50);
    firstButton.tag = 1000;
    [firstButton setTitle:@"页面一" forState:UIControlStateNormal];
    [firstButton addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:firstButton];
    
    UIButton *secondButton = [[UIButton alloc] init];
    secondButton.backgroundColor = [UIColor grayColor];
    secondButton.frame = CGRectMake(100, 50, 100, 50);
    secondButton.tag = 2000;
    [secondButton setTitle:@"页面二" forState:UIControlStateNormal];
    [secondButton addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:secondButton];
}

- (void)change:(UIButton *)button {
    if(button.tag == 1000) {
        NSLog(@"click first");
        if(currentVC == first) {
            NSLog(@"This is first");
            return;
        }
        [self transitionFromViewController:currentVC
                          toViewController:first
                                  duration:0.5
                                   options:UIViewAnimationOptionCurveEaseIn
                                animations:^{}
                                completion:^(BOOL finished) {currentVC = first;}];
    }
    
    if(button.tag == 2000) {
        NSLog(@"click second");
        if(currentVC == second) {
            NSLog(@"This is second");
            return;
        }
        [self transitionFromViewController:currentVC
                          toViewController:second
                                  duration:0.5
                                   options:UIViewAnimationOptionCurveEaseIn
                                animations:^{}
                                completion:^(BOOL finished) {currentVC = second;}];
    }
}


@end
