//
//  Subject.m
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "Subject.h"
#import "Game.h"
@implementation Subject
@synthesize title = _title;
@synthesize date = _date;
@synthesize img = _img;
@synthesize desc_img = _desc_img;
@synthesize desc = _desc;
@synthesize apps = _apps;

- (void)dealloc {

  [_title release];
  [_date release];
  [_img release];
  [_desc_img release];
  [_desc release];
  [_apps release];
  [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

  if ([key isEqualToString:@"applications"]) {
    NSArray *appInfos = (NSArray *)value;

    [appInfos enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx,
                                           BOOL *stop) {

      Game *game = [Game gameWithDic:obj];

      [self.apps addObject:game];

    }];
  }
}

- (id)valueForUndefinedKey:(NSString *)key {

  return nil;
}

- (instancetype)initWithDic:(NSDictionary *)dic {

  if (self = [super init]) {

    _apps = [[NSMutableArray alloc] init];

    [self setValuesForKeysWithDictionary:dic];
  }
  return self;
}

+ (id)subjectWithDic:(NSDictionary *)dic {

  Subject *sb = [[[Subject alloc] initWithDic:dic] autorelease];
  return sb;
}

@end
