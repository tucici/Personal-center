//
//  FocusOnViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/14.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import "FocusOnViewController.h"
#import "Header.h"
@interface FocusOnViewController (){
UIButton *_back_focus;

}
@end

@implementation FocusOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initializeBackButtonAtFocusVC];
    // Do any additional setup after loading the view.
}
-(void)initializeBackButtonAtFocusVC{
    _back_focus = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back_focus setTitle:@"back" forState:UIControlStateNormal];
    [_back_focus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back_focus addTarget:self action:@selector(backActionAtFocusVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back_focus];

}
-(void)backActionAtFocusVC:(UIButton *)sender{

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
