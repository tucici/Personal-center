//
//  SettingViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/19.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "SettingViewController.h"
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UIView *_titleView;                     /*导航栏背景*/
    UIButton *_back_setting;                /*返回*/
    UIButton *_exit_setting;                /*退出当前账号*/
    UIButton *_binding_setting;             /*绑定账号*/
    UILabel *_title_setting;                /*ViewTitle*/
    UITableView *_tableview_setting;        /*主体tableview*/
}
@end
@implementation SettingViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = backViewColor;
    /*initializeTitleView*/
    [self initializeTitleView];
    /*initializeBack*/
    [self initializeBack];
    
    /*initializeTitle*/
    [self initializeTitle];
    
    /*initializeTableView*/
    [self initializeTableView];
    
    /*initializeExit*/
    [self initializeExit];
    
}
-(void)initializeTitleView{
    _titleView  = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width, statusbarHeight + buttonHeight)];
    [_titleView setBackgroundColor:titleViewColor];
    [self.view addSubview:_titleView];
}
-(void)initializeBack{
    _back_setting = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back_setting setTitle:@"back" forState:UIControlStateNormal];
    [_back_setting setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back_setting addTarget:self action:@selector(backActionAtSettingVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back_setting];
}
-(void)initializeTitle{
    _title_setting = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
    [_title_setting setNumberOfLines:0];
    _title_setting.text= @"设置";
    [_title_setting setTextColor:[UIColor blackColor]];
    [_title_setting sizeToFit];
    _title_setting.center = CGPointMake(view_width * 0.5, _back_setting.frame.size.height * 0.5 + statusbarHeight);
    [self.view addSubview:_title_setting];
}
-(void)initializeTableView{
    CGFloat maxY = CGRectGetMaxY(_back_setting.frame);
    CGFloat height = view_height - maxY - buttonHeight - 50.0;
    _tableview_setting = [[UITableView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_back_setting.frame), view_width, height) style:UITableViewStyleGrouped];
    _tableview_setting.scrollEnabled = NO;
    _tableview_setting.delegate = self;
    _tableview_setting.dataSource = self;
    _tableview_setting.showsVerticalScrollIndicator = NO;
    _tableview_setting.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableview_setting];
    
}
-(void)initializeExit{
    _exit_setting = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width - 20.0, buttonHeight)];
    [_exit_setting setTitle:@"退出当前账号" forState:UIControlStateNormal];
    [_exit_setting setBackgroundColor:mainColor];
    _exit_setting.center = CGPointMake(view_width * 0.5, view_height - 30.0 - _exit_setting.frame.size.height * 0.5);
    _exit_setting.layer.masksToBounds = YES;
    _exit_setting.layer.cornerRadius = 5.0;
    [_exit_setting addTarget:self action:@selector(exitActionAtSettingVC:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_exit_setting];
    
}
#pragma mark UIButtonAction
-(void)backActionAtSettingVC:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)exitActionAtSettingVC:(UIButton *)sender{
    
}
-(void)bindingAction:(UIButton *)sender{
    
    
}
#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 3;
    }else if (section == 3){
        return 1;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"SettingUITableViewCell";
    UITableViewCell *cell = [_tableview_setting dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"编辑个人资料";
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }else if (indexPath.row == 1){
            [cell.textLabel setText:@"接收通知"];
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }else if (indexPath.row == 2){
            [cell.textLabel setText:@"账号安全"];
            //            [cell setAccessoryType:UITableViewCellAccessoryDetailButton];
            _binding_setting = [[UIButton alloc]initWithFrame:CGRectMake(view_width - buttonWidth, 0.0, buttonWidth, cell.frame.size.height)];
            [_binding_setting setTitle:@"未绑定" forState:UIControlStateNormal];
            [_binding_setting setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_binding_setting addTarget:self action:@selector(bindingAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:_binding_setting];
        }else if (indexPath.row == 3){
            [cell.textLabel setText:@"修改密码"];
        }
        
        
    }
    
    return cell;
    
}
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
@end
