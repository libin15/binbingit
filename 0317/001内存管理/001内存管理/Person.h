//
//  Person.h
//  001内存管理
//
//  Created by 黎跃春 on 15-3-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (instancetype)init;

//设计模式，单例，委托［delegate］，观察者［通知，KVO］，MVC，目标动作，23种
//工厂方法
+ (Person*)person;


@end
