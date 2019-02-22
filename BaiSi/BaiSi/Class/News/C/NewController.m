//
//  NewController.m
//  BaiSi
//
//  Created by user on 2019/2/18.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "NewController.h"

@interface NewController ()

@end

@implementation NewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    // 设置背景色
    self.view.backgroundColor = MyGlobalBg;
}
- (void)tagClick{
    
}

@end
