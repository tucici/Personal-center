//
//  AboutCompanyViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/20.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "CompanyViewController.h"
@interface CompanyViewController (){
    UIView *_titleview_com;             /*导航栏背景*/
    UIButton *_back_com;                /*返回*/
    UILabel *_title_com;                /*ViewTitle*/
    UIImageView *_groudview_com;        /*主体背景*/
    
}
@end
@implementation CompanyViewController
-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = backViewColor;
    
    /*initializeTitleView*/
    [self initializeTitleView];
    /*initializeBack*/
    [self initializeBack];
    
    /*initializeTitle*/
    [self initializeTitle];
    
    /*initializeGroudView*/
    [self initializeGroudView];
}
/*initializeTitleView*/
-(void)initializeTitleView{
    _titleview_com  = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width, statusbarHeight + buttonHeight)];
    [_titleview_com setBackgroundColor:titleViewColor];
    [self.view addSubview:_titleview_com];
    
}
/*initializeBack*/
-(void)initializeBack{
    _back_com
    = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back_com setTitle:@"back" forState:UIControlStateNormal];
    [_back_com setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back_com addTarget:self action:@selector(backActionAtComVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back_com];
}
/*initializeTitle*/
-(void)initializeTitle{
    _title_com = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
    [_title_com setNumberOfLines:0];
    _title_com.text= @"关于我们";
    [_title_com setTextColor:[UIColor blackColor]];
    [_title_com sizeToFit];
    _title_com.center = CGPointMake(view_width * 0.5, _back_com.frame.size.height * 0.5 + statusbarHeight);
    [self.view addSubview:_title_com];
}
/*initializeGroudView*/
-(void)initializeGroudView{
    _groudview_com = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_back_com.frame), view_width , view_height - statusbarHeight - buttonHeight)];
    [_groudview_com setImage:[UIImage imageNamed:@"1"]];
    [self.view addSubview:_groudview_com];
}
#pragma  mark UIButtonAction
-(void)backActionAtComVC:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
