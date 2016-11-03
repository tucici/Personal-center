
//
//  FansViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/19.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import "FansViewController.h"
#import "Header.h"
@interface FansViewController(){
    UIButton *_back_fans;

}
@end
@implementation FansViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initializeBackButton];

}
-(void)initializeBackButton{
    _back_fans = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back_fans setTitle:@"back" forState:UIControlStateNormal];
    [_back_fans setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back_fans addTarget:self action:@selector(backActionAtFansVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back_fans];

}
#pragma mark buttonAction
-(void)backActionAtFansVC:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
