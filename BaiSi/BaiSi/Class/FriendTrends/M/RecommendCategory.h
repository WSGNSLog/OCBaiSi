//
//  RecommendCategory.h
//  BaiSi
//
//  Created by user on 2019/2/21.
//  Copyright © 2019 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecommendCategory : NSObject

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *users;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger currentPage;


@end

NS_ASSUME_NONNULL_END
