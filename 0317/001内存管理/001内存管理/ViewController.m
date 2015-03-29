//
//  ViewController.m
//  001内存管理
//
//  Created by 黎跃春 on 15-3-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "ViewController.h"
#import "Pig.h"
#import "Computer.h"
#import "Cpu.h"
#import "Person.h"
@interface ViewController () {
    UIButton* _button;

    NSArray* _array;
}

@property (nonatomic, retain) UILabel* label;

@property (nonatomic, retain) NSArray* arr;

@end

@implementation ViewController
@synthesize label = _label;
@synthesize arr = _arr;

- (void)viewDidLoad
{
    [super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.

#pragma mark--下面三种对象的创建方式都是等价的
#if 0
    Pig *pig = [Pig new];
    Pig *pig0 = Pig.new;
    
    Pig *pig1 = [[Pig alloc] init];
#endif
    //    malloc(100)
    //    free()
    Pig* pig = [[Pig alloc] init];

    [pig eat];

    [pig release];

//    pig已经成为了僵尸对象
//    *** -[Pig eat]: message sent to deallocated instance 0x7f96b940c9e0
//    [pig eat];

//    ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
#pragma mark--下面的代码理论上没问题,但是我们不要这么写
#if 0
    Pig *p00 = [[Pig alloc] init]; //1
    Pig *p01 = p00;//
    Pig *p02 = [p01 retain];
    Pig *p03 = [p00 retain];
    
    [p00 eat];
    [p01 release];
    [p01 release];
    [p01 eat];

    [p03 eat];
    [p02 eat];
    
    [p01 release];
#endif
#pragma mark -－谁是红色箭头，谁去release
    Pig* p00 = [[Pig alloc] init]; //1
    Pig* p01 = p00; //
    Pig* p02 = [p01 retain];
    Pig* p03 = [p00 retain];

    
    UIColor*color = [UIColor redColor];
    
    [p00 eat];
    [p00 release];
    [p01 eat];
    [p03 eat];
    [p03 release];
    [p02 eat];
    [p02 release];

//    liyuechun.local
//==================================
#pragma mark--标准set方法写法
    Computer* apple = [[Computer alloc] init]; //1

    Cpu* cpu = [[Cpu alloc] init]; //1

    [apple setCpu:cpu]; //2

    [cpu release]; //1

    Cpu* cpu00 = [[Cpu alloc] init]; //1
    [apple setCpu:cpu00];

    [cpu00 release];

    [apple setCpu:cpu00];

    [apple release];

    //    ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

    _label = [[UILabel alloc] init]; //1

    //    _button = [[UIButton alloc] init];

    _button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];

    //    Person *per = [[Person alloc] init];//1
    //
    //    Person *per00 = [Person person];//1

    _arr = [@[ @"12", @"432" ] retain];

    _array = [[NSArray arrayWithObject:@"134"] retain];
    _array = [[NSArray alloc] initWithObjects:@"123", nil];

    _arr = [[NSArray arrayWithObject:@"134"] retain];

    self.arr = [NSArray arrayWithObject:@"134"];

    _arr = [[NSArray alloc] initWithObjects:@"123", nil];
}

- (void)dealloc
{

    [_button release];
    [_label release];
    [_array release];
    [_arr release];
    [super dealloc];
}

@end
