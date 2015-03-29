//
//  Person.m
//  001内存管理
//
//  Created by 黎跃春 on 15-3-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init{

    if (self = [super init]) {
        
    }
    return self;
}

+ (Person*)person{
    Person *person = [[[Person alloc] init] autorelease];
    return person;
}

@end









