//
//  HttpMessageManager.m
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "HttpMessageManager.h"
#import "HttpManager.h"

@interface HttpMessageManager()<HttpManagerDelegate>

//数据下载时，具体的实现对象
@property (nonatomic, retain) HttpManager *httpManager;


@end

static HttpMessageManager *httpMessageManager = nil;

@implementation HttpMessageManager
@synthesize httpManager = _httpManager;

- (void)dealloc{

    [_httpManager release];
    [super dealloc];
}

+ (id)sharedHttpMessageManager{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpMessageManager = [[super allocWithZone:NULL] init];
    });
    return httpMessageManager;
}

- (instancetype)init{

    if (self = [super init]) {
//        创建对象
        _httpManager = [[HttpManager alloc] initWithDelegate:self];
//        启动队列
        [self.httpManager start];
    }
    return self;
}
#pragma mark --数据访问
- (void)accessSubjectPage:(NSInteger)page{
    
    [self.httpManager accessSubjectPage:page];
    
}

//如果需要新的数据访问，直接从这儿往下添加

#pragma mark --HttpManagerDelegate
- (void)accessDataDidFinish:(NSDictionary *)dataDic andType:(ReqestType)type{

    NSString *notiName = nil;
    
    if (type == ENUM_SubjectType) {
        notiName = Noti_ENUM_SubjectType;
    }
//    通过通知的名字和dataDic创建noti对象
    NSNotification *noti = [NSNotification notificationWithName:notiName object:dataDic];
    
//    发送通知
    [[NSNotificationCenter defaultCenter] postNotification:noti];
    
}

@end
















