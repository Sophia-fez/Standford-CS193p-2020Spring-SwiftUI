//
//  AppDelegate.m
//  7_pushPresentDemo
//
//  Created by Sophia Fez on 2020/12/8.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // a.初始化一个tabBar控制器
    UITabBarController *tb = [[UITabBarController alloc]init];
    // 设置控制器为window的控制器
    self.window.rootViewController = tb;
    
    // b.创建子控制器
    
    HomeViewController *home = [[HomeViewController alloc] init];
    home.view.backgroundColor = [UIColor orangeColor];
    UINavigationController *navigationView = [[UINavigationController alloc] initWithRootViewController:home];
    navigationView.tabBarItem.title = @"主页";
    navigationView.tabBarItem.image = [UIImage imageNamed:@"tab_home_icon"];
    //[navigationView.navigationController popViewControllerAnimated:YES]; // 这句应该放在哪？
    
    FindViewController *find = [[FindViewController alloc] init];
    find.view.backgroundColor = [UIColor redColor];
    find.tabBarItem.title = @"发现";
    find.tabBarItem.image = [UIImage imageNamed:@"tab_find_icon"];
    
    MineViewController *mine = [[MineViewController alloc] init];
    mine.view.backgroundColor = [UIColor blueColor];
    mine.tabBarItem.title = @"我的";
    mine.tabBarItem.image = [UIImage imageNamed:@"tab_mine_icon"];
    
    //c.添加子控制器到TabBarController中
//    // 方式一
//    [tb addChildViewController:home];
//    [tb addChildViewController:find];
//    [tb addChildViewController:mine];
    // 方式二
    tb.viewControllers = @[navigationView, find, mine];
    
    
    // 2.设置window为组窗口并显示出来
    [self.window makeKeyAndVisible];

    return YES;
}



@end
