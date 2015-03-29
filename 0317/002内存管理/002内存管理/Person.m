//
//  Person.m
//  002内存管理
//
//  Created by 黎跃春 on 15-3-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc{
    NSLog(@"%s",__func__);
    [super dealloc];
}

@end
