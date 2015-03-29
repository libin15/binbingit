//
//  ViewController.m
//  爱限免专题
//
//  Created by qianfeng on 15-1-17.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "ViewController.h"
#import "Utils/Header.h"
#import "SubjectCell.h"
#import "HttpMessageManager.h"
#import "MBProgressHUD.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate, MBProgressHUDDelegate>

@property (nonatomic, retain) UITableView *tableView;
//存储数据模型的数组
@property (nonatomic, retain) NSArray *subjects;

@property (nonatomic, retain) MBProgressHUD *HUD;

@end

@implementation ViewController
@synthesize tableView = _tableView;
@synthesize subjects = _subjects;
@synthesize HUD = _HUD;
- (void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:Noti_ENUM_SubjectType
                                                object:nil];
    [_tableView release];
    [_subjects release];
    [_HUD release];
    [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.

    _HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.navigationController.view addSubview:self.HUD];
    self.HUD.delegate = self;
    self.HUD.labelText = @"Loading";
    
    
  //    注册通知

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(didGetData:)
                                               name:Noti_ENUM_SubjectType
                                             object:nil];

  self.automaticallyAdjustsScrollViewInsets = NO;

  _tableView = [[UITableView alloc]
      initWithFrame:CGRectMake(0, NAVGATION_ADD_STATUS_HEIGHT, SCREEN_WIDTH,
                               SCREEN_HEIGHT - NAVGATION_ADD_STATUS_HEIGHT)
              style:UITableViewStylePlain];

  //    设置数据源和代理
   self.tableView.dataSource = self;
   self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
  [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
  self.tableView = nil;
}

#pragma mark--UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {

    return self.subjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  SubjectCell *cell =
      [tableView dequeueReusableCellWithIdentifier:@"SubjectCell"];

  if (cell == nil) {
    NSArray *cells = [[NSBundle mainBundle] loadNibNamed:@"SubjectCell"
                                                   owner:nil
                                                 options:nil];
    cell = [cells firstObject];
  }

#pragma mark-- 配置cell
    Subject *subject = self.subjects[indexPath.row];
    
    [cell configCellWith:subject];
    
  return cell;
}

#pragma mark--UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {

  return 400;
}
//开始下载数据
- (void)viewWillAppear:(BOOL)animated {

  [super viewWillAppear:animated];
    
    [self.HUD show:YES];
    
  //    开始下载数据
  [[HttpMessageManager sharedHttpMessageManager] accessSubjectPage:3];
}

//数据下载完成
- (void)didGetData:(NSNotification *)noti{
    
    [self.HUD hide:YES];
    
    NSDictionary *dic = noti.object;
    
    NSString *isSuccess = dic[@"success"];
    
    if ([isSuccess isEqualToString:@"YES"]) {
        
        self.subjects = dic[@"object"];

        [self.tableView reloadData];
    }else{
    
        NSString *errMessage = dic[@"object"];
    
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:errMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
    }
}

@end













