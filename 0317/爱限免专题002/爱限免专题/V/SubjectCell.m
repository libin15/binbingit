//
//  SubjectCell.m
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "SubjectCell.h"
#import "AppCell.h"
#import "Subject.h"
#import "UIImageView+WebCache.h"
@interface SubjectCell()<UITableViewDataSource, UITableViewDelegate>
/**
 *  title
 */
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;

@property (retain, nonatomic) IBOutlet UIImageView *logoImageView;

@property (retain, nonatomic) IBOutlet UITableView *tabelView;

@property (retain, nonatomic) IBOutlet UIImageView *smallImageView;

@property (retain, nonatomic) IBOutlet UILabel *desLabel;

@property (nonatomic, retain) NSArray *games;

@end


@implementation SubjectCell
@synthesize games = _games;


- (void)awakeFromNib {
    // Initialization code
//    设置数据源和代理
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    self.tabelView.scrollEnabled = NO;
    self.desLabel.adjustsFontSizeToFitWidth = YES;
    
    
}

#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 4;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppCell"];
    if (cell == nil) {
        NSArray *cells =[[NSBundle mainBundle] loadNibNamed:@"AppCell" owner:nil options:nil];
        cell = [cells lastObject];
    }
#pragma mark --配置cell
    
    Game *game = self.games[indexPath.row];
    
    [cell configCellWith:game];
    
    return cell;
}

#pragma mark --UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 65;
}


- (void)configCellWith:(Subject *)subject{
//title
    self.titleLabel.text = subject.title;
    
    
    [self.logoImageView setImageWithURL:[NSURL URLWithString:subject.img] placeholderImage:[UIImage imageNamed:@"Defaultretein5"]];
    
    [self.smallImageView setImageWithURL:[NSURL URLWithString:subject.desc_img] placeholderImage:[UIImage imageNamed:@"account_candou"]];
    
//    描述信息
    self.desLabel.text = subject.desc;
    
    
    self.games = subject.apps;
    
    [self.tabelView reloadData];
    
}


- (void)dealloc {
    [_titleLabel release];
    [_logoImageView release];
    [_tabelView release];
    [_smallImageView release];
    [_desLabel release];
    [_games release];
    [super dealloc];
}
@end
