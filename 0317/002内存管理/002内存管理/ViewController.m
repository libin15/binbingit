//
//  ViewController.m
//  002内存管理
//
//  Created by 黎跃春 on 15-3-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    Person* person = [[Person alloc] init]; //1

    [person release]; //0

    //    autorelease的作用，当给一个对象发送autorelease消息时，系统会自动创建一个自动释放池，会将对应的指针放到池子里面，当池子快被销毁的时候，会对池子里面的所有指针对象一一发送一条release消息

    Person* per11;
    @autoreleasepool
    {

        Person* per00 = [[[Person alloc] init] autorelease];

        NSLog(@"%@", per00);

        @autoreleasepool
        {

            per11 = [[[Person alloc] init] autorelease];
        }
    }

    //   ================
    NSLog(@"%s", __func__);
}

@end
