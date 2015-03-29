//
//  Computer.h
//  001内存管理
//
//  Created by 黎跃春 on 15-3-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Cpu;

@interface Computer : NSObject
{
    @private
    Cpu *_cpu;
}

//retain,copy,assign他们之间的区别？
//assign直接赋值
//retain，属于浅拷贝［指向的对象不变，引用计数加1］
//copy，属于深拷贝 ［重新拷贝一份对象，原来的对象不变，新拷贝的对象引用计数为1］

//黄金法则
//当碰到alloc时会开辟空间，并且引用计数为1，指针为“红线”
//当碰到retain，copy，mutableCopy，指针所指向的对象引用计数＋1，指针为红线
//谁是红线，谁负责“在不使用的时候”给对象发送release

//“在不使用的时候”
//如果是全局的指针，在dealloc函数里面发送release消息
//如果是局部的变量指针，在不适用的时候立即发送release消息


@property (nonatomic, retain) Cpu *cpu;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger price;

@end









