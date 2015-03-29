//
//  AppCell.m
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "AppCell.h"
#import "Game.h"
#import "UIImageView+WebCache.h"

@interface AppCell()
@property (retain, nonatomic) IBOutlet UIImageView *appIcon;



@property (retain, nonatomic) IBOutlet UILabel *gameName;
@property (retain, nonatomic) IBOutlet UILabel *comment;
@property (retain, nonatomic) IBOutlet UILabel *downLoad;
@property (retain, nonatomic) IBOutlet UIImageView *starRank;

@end

@implementation AppCell

- (void)awakeFromNib {
    // Initialization code
    
    self.gameName.adjustsFontSizeToFitWidth = YES;
    self.comment.adjustsFontSizeToFitWidth = YES;
    self.downLoad.adjustsFontSizeToFitWidth = YES;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWith:(Game *)game{

    [self.appIcon setImageWithURL:[NSURL URLWithString:game.iconUrl] placeholderImage:[UIImage imageNamed:@"account_candou"]];
    self.gameName.text = game.name;
    self.comment.text = [NSString stringWithFormat:@"%@",game.comment];
    self.downLoad.text = game.downloads;
    
    
    
}


- (void)dealloc {
    [_appIcon release];
    [_gameName release];
    [_comment release];
    [_downLoad release];
    [_starRank release];
    [super dealloc];
}
@end
