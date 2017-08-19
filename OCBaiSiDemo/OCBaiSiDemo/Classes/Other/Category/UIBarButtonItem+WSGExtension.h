//
//  UIBarButtonItem+WSGExtension.h
//  OCBaiSiDemo
//
//  Created by xiaowu on 2017/8/15.
//  Copyright © 2017年 xiaowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WSGExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
