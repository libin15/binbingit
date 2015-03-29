//
//  Subject.h
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject

//title
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *desc_img;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, retain) NSMutableArray *apps;


- (instancetype)initWithDic:(NSDictionary *)dic;

+ (id)subjectWithDic:(NSDictionary *)dic;


@end
