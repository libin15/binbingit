//
//  Game.h
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic, copy) NSString *applicationId;

@property (nonatomic, copy) NSString *name  ;

@property (nonatomic, copy) NSString *iconUrl;

@property (nonatomic, copy) NSString *starOverall;

@property (nonatomic, copy) NSString *ratingOverall;

@property (nonatomic, copy) NSString *downloads;

@property (nonatomic, retain) NSNumber *comment;


- (instancetype)initWithDic:(NSDictionary *)dic;

+ (id)gameWithDic:(NSDictionary *)dic;


@end
