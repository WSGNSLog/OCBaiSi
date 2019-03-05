//
//  TopicCell.m
//  BaiSi
//
//  Created by user on 2019/2/26.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "TopicCell.h"

@interface TopicCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UILabel *text_Label;


@end

@implementation TopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
