//
//  RecommendCategoryCell.m
//  BaiSi
//
//  Created by user on 2019/2/21.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "RecommendCategoryCell.h"
#import "RecommendCategory.h"

@interface RecommendCategoryCell ()

@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end

@implementation RecommendCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor =MyRGBColor(244, 244, 244);
    self.selectedIndicator.backgroundColor = MyRGBColor(219, 21, 26);
    
}
- (void)setCategory:(RecommendCategory *)category{
    _category = category;
    self.textLabel.text = category.name;
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2*self.textLabel.y;
    self.textLabel.font = [UIFont systemFontOfSize:11];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : MyRGBColor(78, 78, 78);
    
}

@end
