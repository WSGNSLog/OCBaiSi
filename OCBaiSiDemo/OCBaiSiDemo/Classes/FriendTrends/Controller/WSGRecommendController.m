//
//  WSGRecommendController.m
//  OCBaiSiDemo
//
//  Created by xiaowu on 2017/8/25.
//  Copyright © 2017年 xiaowu. All rights reserved.
//

#import "WSGRecommendController.h"

@interface WSGRecommendController ()

@end

@implementation WSGRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
    
    // 设置背景色
    self.view.backgroundColor = WSGGlobalBg;
//
//    // 显示指示器
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
//    
//    // 发送请求
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"a"] = @"category";
//    params[@"c"] = @"subscribe";
//    //http://api.budejie.com/api/api_open.php
//    [[AFHTTPSessionManager manager] GET:@"http://5345345" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//        // 隐藏指示器
//        [SVProgressHUD dismiss];
//        
//        //
//        XMGLog(@"%@", responseObject);
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        // 显示失败信息
//        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
//    }];

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
