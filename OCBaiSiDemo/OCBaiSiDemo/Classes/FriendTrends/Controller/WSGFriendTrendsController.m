//
//  WSGFriendTrendsController.m
//  OCBaiSiDemo
//
//  Created by xiaowu on 2017/8/14.
//  Copyright © 2017年 xiaowu. All rights reserved.
//

#import "WSGFriendTrendsController.h"
#import "WSGRecommendController.h"

@interface WSGFriendTrendsController ()

@end

@implementation WSGFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的关注";
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsBtnClick)];
    
    self.view.backgroundColor = WSGGlobalBg;
}
- (void)friendsBtnClick{

    WSGRecommendController *recomm = [[WSGRecommendController alloc]init];
    [self.navigationController pushViewController:recomm animated:YES];
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
