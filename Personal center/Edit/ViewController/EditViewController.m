//
//  EditViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/20.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "EditViewController.h"
@interface EditViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UIView *_titleview_edit;             /*导航栏背景*/
    UIButton *_back_edit;                /*返回*/
    UITableView *_tableview_edit;        /*主题TableView*/
    UILabel *_title_edit;                /*ViewTitle*/
    
    
}
@end
@implementation EditViewController
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
    
    
    
    
}
-(void)initializeTitleView{
    _titleview_edit  = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width, statusbarHeight + buttonHeight)];
    [_titleview_edit setBackgroundColor:titleViewColor];
    [self.view addSubview:_titleview_edit];
}
-(void)initializeBack{
    _back_edit = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back_edit setTitle:@"back" forState:UIControlStateNormal];
    [_back_edit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back_edit addTarget:self action:@selector(backActionAtEditVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back_edit];
}
-(void)initializeTitle{
    _title_edit = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
    [_title_edit setNumberOfLines:0];
    _title_edit.text= @"编辑个人资料";
    [_title_edit setTextColor:[UIColor blackColor]];
    [_title_edit sizeToFit];
    _title_edit.center = CGPointMake(view_width * 0.5, _back_edit.frame.size.height * 0.5 + statusbarHeight);
    [self.view addSubview:_title_edit];
}
-(void)initializeTableView{
    CGFloat maxY = CGRectGetMaxY(_back_edit.frame);
    CGFloat height = view_height - maxY - buttonHeight - 50.0;
    _tableview_edit = [[UITableView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_back_edit.frame), view_width, height) style:UITableViewStylePlain];
    _tableview_edit.scrollEnabled = NO;
    _tableview_edit.delegate = self;
    _tableview_edit.dataSource = self;
    _tableview_edit.showsVerticalScrollIndicator = NO;
    _tableview_edit.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableview_edit];
    
}
#pragma mark UIButtonAction
-(void)backActionAtEditVC:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}
#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"EditUITableViewCell";
    UITableViewCell *cell = [_tableview_edit dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改头像";
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
        
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            [cell.textLabel setText:@"昵称"];
        }else if (indexPath.row == 1){
            [cell.textLabel setText:@"性别"];
        }
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
            
        }
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
    ;
    return (view_height - statusbarHeight - buttonHeight * 2 - 105) / 9.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}


@end
