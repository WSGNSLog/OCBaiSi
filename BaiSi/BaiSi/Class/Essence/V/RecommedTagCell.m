//
//  RecommedTagCell.m
//  BaiSi
//
//  Created by user on 2019/2/22.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "RecommedTagCell.h"
#import "RecommendTag.h"
#import <UIImageView+WebCache.h>

@interface RecommedTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;


@end
@implementation RecommedTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setRecommedTag:(RecommendTag *)recommedTag{
    _recommedTag = recommedTag;
    [self.imageView setHeader:recommedTag.image_list];
    self.themeNameLabel.text = recommedTag.theme_name;
    NSString *subNumber = nil;
    if (recommedTag.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅", recommedTag.sub_number];
    } else { // 大于等于10000
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅", recommedTag.sub_number / 10000.0];
    }
    self.subNumberLabel.text = subNumber;
}
- (void)setFrame:(CGRect)frame{
    
    frame.origin.x = 5;
    frame.size.width -= 2*frame.origin.x;
    frame.size.height -=1;
    
    [super setFrame:frame];
}
@end
