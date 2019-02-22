//
//  RecommendUserCell.m
//  BaiSi
//
//  Created by user on 2019/2/21.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "RecommendUserCell.h"
#import "RecommendUser.h"
#import <UIImageView+WebCache.h>

@interface RecommendUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation RecommendUserCell

- (void)setUser:(RecommendUser *)user{
    
    _user = user;
    
    self.screenNameLabel.text = user.screen_name;
    NSString *fansCount = nil;
    
    if (user.fans_count < 10000) {
        fansCount = [NSString stringWithFormat:@"%zd人关注",user.fans_count];
    }else{
        fansCount = [NSString stringWithFormat:@"%.1f万人关注",user.fans_count / 10000.0];
    }
    self.fansCountLabel.text = fansCount;
    
    [self.headImageView setHeader:user.header];
}

@end
