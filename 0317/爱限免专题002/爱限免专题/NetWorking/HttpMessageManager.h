//
//  HttpMessageManager.h
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark --注册通知时使用的名字
//专题
#define Noti_ENUM_SubjectType @"Noti_ENUM_SubjectType"


@interface HttpMessageManager : NSObject
/**
 *  工厂方法
 *
 *  @return 单例
 */
+ (id)sharedHttpMessageManager;

#pragma mark --数据请求时访问的方法
/**
 *  专题页面数据访问的方法
 *
 *  @param page 第几页
 */
- (void)accessSubjectPage:(NSInteger)page;


@end
