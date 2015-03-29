//
//  SubjectCell.h
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Subject;

@interface SubjectCell : UITableViewCell

//传入数据模型配置cell
- (void)configCellWith:(Subject *)subject;


@end
