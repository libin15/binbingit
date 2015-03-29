//
//  HttpManager.m
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "HttpManager.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "Subject.h"
@interface HttpManager()
/**
 *  队列，管理ASIHTTPRequest创建的对象
 */
@property (nonatomic, retain)ASINetworkQueue *netWorkQueue;

@end

@implementation HttpManager
@synthesize delegate = _delegate;
@synthesize netWorkQueue = _netWorkQueue;

- (void)dealloc{

    self.delegate = nil;
    [_netWorkQueue release];
    [super dealloc];
}

- (instancetype)initWithDelegate:(id<HttpManagerDelegate>)delegate{
    if (self = [super init]) {
//        设置代理
        self.delegate = delegate;
        
//        1.创建_netWorkQueue对象
        
        _netWorkQueue = [[ASINetworkQueue alloc] init];
        
//        2.给_netWorkQueue设置代理
        
        self.netWorkQueue.delegate = self;
        
//        3.设置队列里面某一个线程启动时开始调用的方法
        
        [self.netWorkQueue setRequestDidStartSelector:@selector(requestDidStart:)];
        
//        4.设置队列里面某一个线程数据下载完成时回调的方法
        
        [self.netWorkQueue setRequestDidFinishSelector:@selector(requestDidFinish:)];
        
//        5.设置队列里面某一个线程数据下载失败时回调的方法
        [self.netWorkQueue setRequestDidFailSelector:@selector(requestDidFail:)];
//        6.设置队列里面所有线程的任务完成时回调的方法
        [self.netWorkQueue setQueueDidFinishSelector:@selector(queueDidFinish:)];
    }
    
    
    return self;
}

#pragma mark --回调方法
//队列里面的某个线程开始启动时调用的方法
- (void)requestDidStart:(ASIHTTPRequest *)request{

}
//队列里面某个线程数据下载成功时回调的方法
- (void)requestDidFinish:(ASIHTTPRequest *)request{
    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionaryWithObject:@"YES" forKey:@"success"];
    
    ReqestType type = [[request.userInfo objectForKey:REQUST_TYPE] integerValue];
    
    NSData *data = [request responseData];
    
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

    if ([object isKindOfClass:[NSArray class]]) {
        
        NSArray *array = (NSArray *)object;
//        创建可变的数组存储数据模型
        NSMutableArray *subjects = [NSMutableArray array];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            
            Subject *subject = [Subject subjectWithDic:obj];
            
            [subjects addObject:subject];
        }];
        
        
        
        [dataDic setObject:subjects forKey:@"object"];
        
        if ([self.delegate respondsToSelector:@selector(accessDataDidFinish:andType:)]) {
            [self.delegate accessDataDidFinish:dataDic andType:type];
        }
        
    }else if ([object isKindOfClass:[NSDictionary class]]){
    
    
    }
    
    
    
    
    
}
//队列里面某个线程数据下载失败时回调的方法
- (void)requestDidFail:(ASIHTTPRequest *)request{
    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionaryWithObject:@"NO" forKey:@"success"];
    
    [dataDic setObject:[request.error localizedDescription] forKey:@"object"];
    
    ReqestType type = [[request.userInfo objectForKey:REQUST_TYPE] integerValue];
    
    if ([self.delegate respondsToSelector:@selector(accessDataDidFinish:andType:)]) {
        [self.delegate accessDataDidFinish:dataDic andType:type];
    }
    
}
//队列里面所有的线程数据下载完成时回调的方法
- (void)queueDidFinish:(ASINetworkQueue *)netWorkQueue{

}

#pragma mark --数据请求时访问的方法

- (void)setGetMethod:(ASIHTTPRequest *)request and:(ReqestType)type{
//根据type参数拼接字典
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:type] forKey:REQUST_TYPE];
//    设置userInfo属性，以便区分具体是哪一个请求
    request.userInfo = userInfo;
    
}


/**
 *  专题页面数据访问的方法
 *
 *  @param page 第几页
 */
- (void)accessSubjectPage:(NSInteger)page{
//地址
    NSString *path = [NSString stringWithFormat:SUBJECT_URL,page];
//    转换成URL
    NSURL *url = [NSURL URLWithString:path];
//    创建线程
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
//    设置userInfo属性
    [self setGetMethod:request and:ENUM_SubjectType];
    
//    将线程添加到队列里面
    [self.netWorkQueue addOperation:request];

}



#pragma mark - Operate queue
//判断self.netWorkQueue是否处于运行状态
- (BOOL)isRunning {
    return ![self.netWorkQueue isSuspended];
}
//启动队列
- (void)start {
    if ([self.netWorkQueue isSuspended])
        [self.netWorkQueue go];
}
//停止
- (void)pause {
    [self.netWorkQueue setSuspended:YES];
}
//重新开始
- (void)resume {
    [self.netWorkQueue setSuspended:NO];
}
//取消队列里面所有线程
- (void)cancel {
    [self.netWorkQueue cancelAllOperations];
}

@end













