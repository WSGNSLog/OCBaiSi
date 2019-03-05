//
//  TopicController.h
//  BaiSi
//
//  Created by user on 2019/2/26.
//  Copyright © 2019 Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopicController : UITableViewController
/** 帖子类型(交给子类去实现) */
@property (nonatomic, assign) BSTopicType type;
@end

NS_ASSUME_NONNULL_END
