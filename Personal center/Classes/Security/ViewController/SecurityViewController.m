//
//  SecurityViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/20.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import "SecurityViewController.h"
#import "Header.h"
@interface SecurityViewController(){
    UIButton *_back_secuirity;
}
@end
@implementation SecurityViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initializeBackButtonAtSecVC];

}
-(void)initializeBackButtonAtSecVC{
    _back_secuirity = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back_secuirity setTitle:@"back" forState:UIControlStateNormal];
    [_back_secuirity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back_secuirity addTarget:self action:@selector(backActionAtSecVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back_secuirity];


}
-(void)backActionAtSecVC:(UIButton *)sender{

}
@end
