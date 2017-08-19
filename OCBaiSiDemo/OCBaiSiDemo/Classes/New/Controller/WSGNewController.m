//
//  WSGNewController.m
//  OCBaiSiDemo
//
//  Created by xiaowu on 2017/8/14.
//  Copyright © 2017年 xiaowu. All rights reserved.
//

#import "WSGNewController.h"

@interface WSGNewController ()

@end

@implementation WSGNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagBtnClick)];
    
}
- (void)tagBtnClick{
    WSGLog(@"%s",__func__);
}
@end
