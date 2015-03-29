//
//  Game.m
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "Game.h"

@implementation Game
@synthesize applicationId = _applicationId;
@synthesize iconUrl = _iconUrl;
@synthesize name = _name;
@synthesize starOverall = _starOverall;
@synthesize ratingOverall = _ratingOverall;
@synthesize downloads = _downloads;
@synthesize comment = _comment;


- (void)dealloc{

    [_applicationId release];
    [_iconUrl release];
    [_name release];
    [_starOverall release];
    [_ratingOverall release];
    [_downloads release];
    [_comment release];
    [super dealloc];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (id)valueForUndefinedKey:(NSString *)key{

    return nil;
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}


+ (id)gameWithDic:(NSDictionary *)dic{

    Game *game = [[[Game alloc] initWithDic:dic] autorelease];
    return game;
}

@end










