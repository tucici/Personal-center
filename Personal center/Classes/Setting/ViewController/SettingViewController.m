//
//  SettingViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/19.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "SettingViewController.h"
#import "AgreementViewController.h"
#import "CompanyViewController.h"
#import "EditViewController.h"
#import "HelpViewController.h"
#import "SecurityViewController.h"
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UIView *_titleView_setting;             /*导航栏背景*/
    UIButton *_back_setting;                /*返回*/
    UIButton *_exit_setting;                /*退出当前账号*/
    UIButton *_binding_setting;             /*绑定账号*/
    UILabel *_title_setting;                /*ViewTitle*/
    UITableView *_tableview_setting;        /*主体tableview*/
    UISwitch *_notice;                      /*通知开关*/
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
    _titleView_setting  = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width, statusbarHeight + buttonHeight)];
    [_titleView_setting setBackgroundColor:titleViewColor];
    [self.view addSubview:_titleView_setting];
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
    _tableview_setting = [[UITableView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_back_setting.frame), view_width, height) style:UITableViewStylePlain];
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
    NSLog(@"账号安全，未绑定");
    
}
-(void)clearMemory:(UIButton *)sender{
    NSLog(@"清除缓存 100MB");
    
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
            _notice = [[UISwitch alloc]initWithFrame:CGRectMake(view_width - buttonWidth, 0.0, buttonWidth, cellHeight)];
            [_notice setOnTintColor:mainColor];
            _notice.transform = CGAffineTransformMakeScale(0.85, 0.85);
            [_notice setCenter:CGPointMake(_notice.center.x + _notice.frame.size.width * 0.15, cellHeight * 0.5)];
            [cell addSubview:_notice];
        }else if (indexPath.row == 2){
            [cell.textLabel setText:@"账号安全"];
            _binding_setting = [[UIButton alloc]initWithFrame:CGRectMake(view_width - buttonWidth, 0.0, buttonWidth, cellHeight)];
            [_binding_setting setTitle:@"未绑定" forState:UIControlStateNormal];
            [_binding_setting.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12]];
            [_binding_setting setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_binding_setting addTarget:self action:@selector(bindingAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:_binding_setting];
        }else if (indexPath.row == 3){
            [cell.textLabel setText:@"修改密码"];
        }
        
    }
    else if (indexPath.section == 1){
        [cell.textLabel setText:@"清除缓存"];
        UIButton *clearMemory = [[UIButton alloc]initWithFrame:CGRectMake(view_width - buttonWidth, 0.0, buttonWidth, cellHeight)];
        [clearMemory setTitle:@"100MB" forState:UIControlStateNormal];
        [clearMemory.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12]];
        [clearMemory setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [clearMemory addTarget:self action:@selector(clearMemory:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:clearMemory];
    }
    else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            [cell.textLabel setText:@"我的邀请码"];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 0.0, cellHeight)];
            [label setNumberOfLines: 0];
            [label setText:@"im8431"];
            [label setFont:[UIFont fontWithName:@"Arial" size:12]];
            [label setTextColor:[UIColor blackColor]];
            [label sizeToFit];
            [label setCenter:CGPointMake(view_width * 0.5, cellHeight * 0.5)];
            [cell addSubview:label];
            
        }else if (indexPath.row == 1){
            [cell.textLabel setText:@"帮助和反馈"];
        }else if (indexPath.row == 2){
            [cell.textLabel setText:@"用户协议"];
        }
        
    }
    else if (indexPath.section == 3){
        [cell.textLabel setText:@"关于我们"];
    }
    
    return cell;
    
}

/*cell选中高亮后,恢复原来状态*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            EditViewController *editVC = [[EditViewController alloc]init];
            [self presentViewController:editVC animated:NO completion:nil];
            NSLog(@"编辑个人资料");
        }else if (indexPath.row == 1){
            NSLog(@"接收通知");
            _notice.on = !_notice.on;
            
        }else if (indexPath.row == 2){
            
            NSLog(@"账号安全");
        }else if (indexPath.row == 3){
            
            NSLog(@"修改密码");
        }
    }else if (indexPath.section == 1){
        NSLog(@"清除缓存");
        
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            NSLog(@"我的邀请码");
        }else if (indexPath.row == 1){
            
            HelpViewController *helpVC = [[HelpViewController alloc]init];
            [self presentViewController:helpVC animated:NO completion:nil];
            NSLog(@"帮助和反馈");
        }else if (indexPath.row == 2){
            AgreementViewController *agmVC = [[AgreementViewController alloc]init];
            [self presentViewController:agmVC animated:NO completion:nil];
            
            NSLog(@"用户协议");
        }
    }else if (indexPath.section == 3){
        CompanyViewController *comVC = [[CompanyViewController alloc]init];
        [self presentViewController:comVC animated:NO completion:nil];
        NSLog(@"关于我们");
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 15.0;
    }else if (section == 1){
        return 10.0;
    }else if (section == 2){
        return 10.0;
    }else if (section == 3){
        return 20.0;
    }
    return 0.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
/*补齐cell的分割线*/
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
/*补齐cell的分割线*/
-(void)viewDidLayoutSubviews {
    
    if ([_tableview_setting respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableview_setting setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_tableview_setting respondsToSelector:@selector(setLayoutMargins:)])  {
        [_tableview_setting setLayoutMargins:UIEdgeInsetsZero];
    }
    
}
@end
