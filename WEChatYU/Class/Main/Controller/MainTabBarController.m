//
//  MainTabBarController.m
//  WEChatYU
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MainTabBarController.h"
#import "DiscoverViewController.h"
#import "GroupViewController.h"
#import "SessionViewController.h"
#import "SettingViewController.h"
#import "MainNavigationController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupItem];
    [self setupChildVC];
}
- (void)setupChildVC{
    [self setupChildVc:[[SessionViewController alloc] init] title:@"会话" image:@"home_normal" selectedImage:@"home_highlight"];
    [self setupChildVc:[[GroupViewController alloc] init] title:@"讨论组" image:@"account_normal" selectedImage:@"account_highlight"];
    [self setupChildVc:[[DiscoverViewController alloc] init] title:@"发现" image:@"message_normal" selectedImage:@"message_highlight"];
    [self setupChildVc:[[SettingViewController alloc] init] title:@"设置" image:@"mycity_normal" selectedImage:@"mycity_highlight"];
}
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)normalImage selectedImage:(NSString *)selectedImage{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:normalImage];
    // 声明：这张图片按照原始的样子显示出来，不要渲染成其他的颜色（比如说默认的蓝色）
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:[[MainNavigationController alloc] initWithRootViewController:vc]];
}
- (void)setupItem{
//改变Tabbar字体大小和颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12],NSFontAttributeName,nil] forState:UIControlStateSelected];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
