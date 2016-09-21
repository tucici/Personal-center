//
//  UserAgreementViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/20.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "AgreementViewController.h"
@interface AgreementViewController (){
    UIView *_titleview_agm;             /*导航栏背景*/
    UIButton *_back_agm;                /*返回*/
    UILabel *_title_agm;                /*ViewTitle*/
    UIImageView *_groudview_agm;        /*主体背景*/
    
}
@end
@implementation AgreementViewController
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
    _titleview_agm  = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width, statusbarHeight + buttonHeight)];
    [_titleview_agm setBackgroundColor:titleViewColor];
    [self.view addSubview:_titleview_agm];
    
}
/*initializeBack*/
-(void)initializeBack{
    _back_agm = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back_agm setTitle:@"back" forState:UIControlStateNormal];
    [_back_agm setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back_agm addTarget:self action:@selector(backActionAtAgmVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back_agm];
}
/*initializeTitle*/
-(void)initializeTitle{
    _title_agm = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
    [_title_agm setNumberOfLines:0];
    _title_agm.text= @"用户协议";
    [_title_agm setTextColor:[UIColor blackColor]];
    [_title_agm sizeToFit];
    _title_agm.center = CGPointMake(view_width * 0.5, _back_agm.frame.size.height * 0.5 + statusbarHeight);
    [self.view addSubview:_title_agm];
}
/*initializeGroudView*/
-(void)initializeGroudView{
    _groudview_agm = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_back_agm.frame), view_width , view_height - buttonHeight - statusbarHeight)];
    [_groudview_agm setImage:[UIImage imageNamed:@"1"]];
    [self.view addSubview:_groudview_agm];
}
#pragma  mark UIButtonAction
-(void)backActionAtAgmVC:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
