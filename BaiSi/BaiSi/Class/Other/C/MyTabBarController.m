//
//  MyTabBarController.m
//  BaiSi
//
//  Created by user on 2019/2/17.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyNavigationController.h"
#import "EssenceController.h"
#import "NewController.h"
#import "MeController.h"
#import "FriendController.h"
#import "MyTabBar.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController
+ (void)initialize{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}
- (void)setUpChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    //设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.title = title;
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    MyNavigationController *nav = [[MyNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildVC:[[EssenceController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setUpChildVC:[[NewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setUpChildVC:[[FriendController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setUpChildVC:[[MeController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    // 更换tabBar
    [self setValue:[[MyTabBar alloc] init] forKeyPath:@"tabBar"];
    
}


@end
