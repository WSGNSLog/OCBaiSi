//
//  UIBarButtonItem+Extension.h
//  BaiSi
//
//  Created by user on 2019/2/18.
//  Copyright © 2019 Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Extension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
