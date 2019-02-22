//
//  RecommendCategory.m
//  BaiSi
//
//  Created by user on 2019/2/21.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "RecommendCategory.h"
#import <MJExtension.h>

@implementation RecommendCategory

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID" : @"id"};
}

- (NSMutableArray *)users{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
