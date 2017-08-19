//
//  WSGTabBar.m
//  OCBaiSiDemo
//
//  Created by xiaowu on 2017/8/14.
//  Copyright © 2017年 xiaowu. All rights reserved.
//

#import "WSGTabBar.h"

@interface WSGTabBar ()
@property (nonatomic,strong) UIButton *publishBtn;
@end

@implementation WSGTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        // 设置tabbar的背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        publishBtn.size = publishBtn.currentBackgroundImage.size;
        [self addSubview:publishBtn];
        self.publishBtn = publishBtn;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.width;
    CGFloat height = self.height;
    
//    self.publishBtn.bounds = CGRectMake(0, 0, self.publishBtn.currentBackgroundImage.size.width, self.publishBtn.currentBackgroundImage.size.height);
    
    self.publishBtn.center = CGPointMake(width * 0.5, height * 0.5);
    
    //设置其他UITabBarButton的frame
    CGFloat btnY = 0;
    CGFloat btnW = width/5;
    CGFloat BtnH = height;
    NSInteger index = 0;
    for (UIButton *btn in self.subviews) {
        if (![btn isKindOfClass:[UIControl class]] || btn == self.publishBtn)continue;
    
        //计算按钮的x值
        CGFloat btnX = btnW * ((index>1)?(index+1):index);
        btn.frame = CGRectMake(btnX, btnY, btnW, BtnH);
        
        index++;
    }
}
@end
