//
//  UIImageView+Extension.m
//  BaiSi
//
//  Created by user on 2019/2/22.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "UIImageView+Extension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (Extension)
- (void)setHeader:(NSString *)url{
    UIImage *placeHolder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeHolder completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.image = image?[image circleImage] : placeHolder;
        
    }];
}
@end
