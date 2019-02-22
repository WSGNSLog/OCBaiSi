//
//  RecommendUser.h
//  BaiSi
//
//  Created by user on 2019/2/21.
//  Copyright © 2019 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecommendUser : NSObject

@property (nonatomic, copy) NSString *header;

@property (nonatomic, assign) NSInteger fans_count;

@property (nonatomic, copy) NSString *screen_name;

@end

NS_ASSUME_NONNULL_END
