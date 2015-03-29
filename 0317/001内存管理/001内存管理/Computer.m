//
//  Computer.m
//  001内存管理
//
//  Created by 黎跃春 on 15-3-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "Computer.h"
#import "Cpu.h"
@implementation Computer
@synthesize cpu = _cpu;
@synthesize name = _name;
@synthesize price = _price;


- (void)setPrice:(NSInteger)price{

    _price = price;
}

- (NSInteger)price{
    return _price;
}

- (void)setName:(NSString *)name{
    
    if (_name != name) {
        [_name release];
        _name = [name copy];
    }
}

- (NSString *)name{
    
    return _name;
}

#pragma mark --set方法
- (void)setCpu:(Cpu *)cpu{

    if (_cpu != cpu) {
        
        [_cpu release];
        
        _cpu = [cpu retain];
    }
    
}

- (Cpu *)cpu{
    
    return _cpu;
}

- (void)dealloc{
    [_cpu release];
    [super dealloc];
}

@end
