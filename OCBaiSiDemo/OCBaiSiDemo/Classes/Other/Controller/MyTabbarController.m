//
//  MyTabbarController.m
//  OCBaiSiDemo
//
//  Created by xiaowu on 2017/8/13.
//  Copyright © 2017年 xiaowu. All rights reserved.
//

#import "MyTabbarController.h"
#import "WSGMeController.h"
#import "WSGNewController.h"
#import "WSGEssenceController.h"
#import "WSGFriendTrendsController.h"
#import "WSGNavigationController.h"
#import "WSGTabBar.h"

@interface MyTabbarController ()

@end

@implementation MyTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UINavigationBar appearance];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    [self setUpChildVC:[[WSGEssenceController alloc]init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setUpChildVC:[[WSGNewController alloc]init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setUpChildVC:[[WSGFriendTrendsController alloc]init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setUpChildVC:[[WSGMeController alloc]init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    [self setValue:[[WSGTabBar alloc]init] forKeyPath:@"tabBar"];
    
}
- (void)setUpChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    WSGNavigationController *nav = [[WSGNavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nav];
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
