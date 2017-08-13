//
//  MyTabbarController.m
//  OCBaiSiDemo
//
//  Created by xiaowu on 2017/8/13.
//  Copyright © 2017年 xiaowu. All rights reserved.
//

#import "MyTabbarController.h"

@interface MyTabbarController ()

@end

@implementation MyTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.tabBarItem.title = @"";
    vc1.tabBarItem.image = [UIImage imageNamed:@""];
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@""];
    vc1.view.backgroundColor = [UIColor grayColor];
    
    
    
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
