//
//  HttpManager.h
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASIHTTPRequest;
@class ASINetworkQueue;

//专题页面数据访问的接口
#define SUBJECT_URL @"http://iappfree.candou.com:8080/free/special?page=%d&limit=5"


//用来做userInfo的key
#define REQUST_TYPE @"REQUST_TYPE"

typedef enum : NSUInteger {
    
    ENUM_SubjectType = 100,//专题
    
} ReqestType;



@protocol HttpManagerDelegate <NSObject>

@optional
/**
 *  通过delegate将dataDic返回到HttpMessageManager里面
 *
 *  @param dataDic success:YES,object:数组
 *
 *  type判断接口
 */

- (void)accessDataDidFinish:(NSDictionary *)dataDic andType:(ReqestType)type;



@end


@interface HttpManager : NSObject
/**
 *  初始化方法
 *
 *  @param delegate 委托
 *
 *  @return instancetype
 */
- (instancetype)initWithDelegate:(id<HttpManagerDelegate>)delegate;

/**
 *  委托
 */
@property (nonatomic, assign) id<HttpManagerDelegate> delegate;

#pragma mark --数据请求时访问的方法
/**
 *  专题页面数据访问的方法
 *
 *  @param page 第几页
 */
- (void)accessSubjectPage:(NSInteger)page;






#pragma mark --Operate Queue
//判断是否处于活动状态
- (BOOL)isRunning;
//启动队列
- (void)start;
// 暂停
- (void)pause;
//恢复状态
- (void)resume;
//取消
- (void)cancel;


@end









