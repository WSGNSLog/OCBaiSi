//
//  WSGNavigationController.m
//  OCBaiSiDemo
//
//  Created by xiaowu on 2017/8/19.
//  Copyright © 2017年 xiaowu. All rights reserved.
//

#import "WSGNavigationController.h"

@interface WSGNavigationController ()

@end

@implementation WSGNavigationController
/**
 * 当第一次使用这个类的时候会调用一次
 */
+ (void)initialize
{
    // 当导航栏用在XMGNavigationController中, appearance设置才会生效
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
/**
 *拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    if (self.childViewControllers.count>1) {//进来的不是第一个控制器--->push进来的控制器
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        btn.size = CGSizeMake(70, 30);
        
        //让按钮内部所有内容左对齐
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];;
        //push进来的控制器隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    //super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}

- (void)backBtnClick{
    [self popViewControllerAnimated:YES];
}

@end
