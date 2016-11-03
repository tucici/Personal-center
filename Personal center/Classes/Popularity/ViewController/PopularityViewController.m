//
//  PopularityViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/14.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import "PopularityViewController.h"
#import "Header.h"
@interface PopularityViewController (){
    UIButton *_back_pop;

}
@end

@implementation PopularityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initializeBackButtonAtPopVC];
    // Do any additional setup after loading the view.
}
-(void)initializeBackButtonAtPopVC{
    _back_pop = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back_pop setTitle:@"back" forState:UIControlStateNormal];
    [_back_pop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back_pop addTarget:self action:@selector(backActionAtPopVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back_pop];

}
#pragma mark UIButtonAction
-(void)backActionAtPopVC:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
