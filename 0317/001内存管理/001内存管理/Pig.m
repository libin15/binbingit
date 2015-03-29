//
//  Pig.m
//  001内存管理
//
//  Created by 黎跃春 on 15-3-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "Pig.h"

@implementation Pig
@synthesize name = _name;

- (void)setName:(NSString *)name{

}

- (NSString *)name{
    
    return _name;
}


- (void)eat{
    
    NSLog(@"%s",__func__);
}

@end
