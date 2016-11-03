//
//  HelpViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/20.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#define kCursorVelocity 1.0f/8.0f
#import "Header.h"
#import "OpinionView.h"
#import "HelpViewController.h"
@interface HelpViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,OpinionViewDelegate>{
    UIView *_titleview_help;             /*导航栏背景*/
    UIButton *_back_help;                /*返回*/
    UIButton *_feedback;                 /*反馈*/
    UILabel *_title_help;                /*ViewTitle*/
    OpinionView *_opinion;               /*留言反馈栏*/
    UITableView *_tableview_help;        /*主体tableview*/
    CGFloat keyboardHeight;              /*键盘的高度*/
}
@end
@implementation HelpViewController
-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = backViewColor;
    
    /*initializeTitleView*/
    [self initializeTitleView];
    
    /*initializeBack*/
    [self initializeBack];
    
    /*initializeTitle*/
    [self initializeTitle];
    
    /*initilizeTableView*/
    [self initializeTableView];
    
    /*initializeTextView*/
    [self initializeTextView];
    
    /*initializeOpinionLabel*/
    //    [self initializeOpinionLabel];
    
    /*initializeFeedBack*/
    [self initializeFeedBack];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    /*获取键盘的高度*/
    [self registerForKeyboardNotifications];
    
}
/*initializeTitleView*/
-(void)initializeTitleView{
    _titleview_help  = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width, statusbarHeight + buttonHeight)];
    [_titleview_help setBackgroundColor:titleViewColor];
    [self.view addSubview:_titleview_help];
    
}
/*initializeBack*/
-(void)initializeBack{
    _back_help = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back_help setTitle:@"back" forState:UIControlStateNormal];
    [_back_help setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back_help addTarget:self action:@selector(backActionAtHelpVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back_help];
}
/*initializeTitle*/
-(void)initializeTitle{
    _title_help = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
    [_title_help setNumberOfLines:0];
    _title_help.text= @"帮助与反馈";
    [_title_help setTextColor:[UIColor blackColor]];
    [_title_help sizeToFit];
    _title_help.center = CGPointMake(view_width * 0.5, _back_help.frame.size.height * 0.5 + statusbarHeight);
    [self.view addSubview:_title_help];
}

/*initilizeTableView*/
-(void)initializeTableView{
    CGFloat height = cellHeight * 6.0;
    _tableview_help = [[UITableView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_back_help.frame), view_width, height) style:UITableViewStylePlain];
    _tableview_help.scrollEnabled = NO;
    _tableview_help.delegate = self;
    _tableview_help.dataSource = self;
    _tableview_help.showsVerticalScrollIndicator = NO;
    _tableview_help.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableview_help];
    
}

/*initializeTextView*/
-(void)initializeTextView{
    CGFloat height = view_height - CGRectGetMaxY(_tableview_help.frame) - buttonHeight - 60.0;
    _opinion= [[OpinionView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_tableview_help.frame), view_width, view_height - CGRectGetMaxY(_tableview_help.frame))];
    _opinion.delegate = self;
    [self.view addSubview:_opinion];
}

/*initializeFeedBack*/
-(void)initializeFeedBack{
    _feedback = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width - 20.0, buttonHeight)];
    [_feedback setTitle:@"点击反馈" forState:UIControlStateNormal];
    [_feedback setBackgroundColor:mainColor];
    _feedback.center = CGPointMake(view_width * 0.5, view_height - 30.0 - _feedback.frame.size.height * 0.5);
    _feedback.layer.masksToBounds = YES;
    _feedback.layer.cornerRadius = 5.0;
    [_feedback addTarget:self action:@selector(feedbackActionAtHelpVC:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_feedback];
    
}

/*获取键盘的高度*/
-(void)registerForKeyboardNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHiden:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWasHiden:(NSNotification *)notification{
    NSDictionary * info = [notification userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    keyboardHeight  = [value CGRectValue].size.height;
    CGFloat animationTime  = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    void(^animation)(void) = ^void(void){
        _opinion.transform = CGAffineTransformIdentity;
        
    };
    
    if (animationTime > 0) {
        [UIView animateWithDuration:animationTime animations:animation];
    } else {
        animation();
    }
    
}
-(void)keyboardWasShown:(NSNotification *)notification{
    NSDictionary * info = [notification userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    keyboardHeight  = [value CGRectValue].size.height;
    CGFloat animationTime  = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    void(^animation)(void) = ^void(void){
        
        _opinion.transform = CGAffineTransformMakeTranslation(0.0,  view_height - keyboardHeight - _opinion.HToBottom_textView );
        
    };
    
    if (animationTime > 0) {
        [UIView animateWithDuration:animationTime animations:animation];
    } else {
        animation();
    }
    
}

#pragma  mark UIButtonAction
-(void)backActionAtHelpVC:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)feedbackActionAtHelpVC:(UIButton *)sender{
    if (!_opinion.writed) {
        
        UIAlertController *inputAlert =[UIAlertController alertControllerWithTitle:@"提示" message:@"提交为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        [inputAlert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:inputAlert animated:NO completion:nil];
    }
    [_opinion clearOpinionViewText];
    NSLog(@"接入意见反馈接口");
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"HelpUITableViewCell";
    UITableViewCell *cell  = [_tableview_help dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    [cell.textLabel setText:@"怎么充值钻石?"];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [_opinion resignFirstResponder];
    
    NSLog(@"点击帮助与反馈");
}
#pragma mark OpinionViewDelegate
-(void)opinionViewAction{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"字数限制在30字以内" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:NO completion:nil];
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
    
    if ([_tableview_help respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableview_help setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_tableview_help respondsToSelector:@selector(setLayoutMargins:)])  {
        [_tableview_help setLayoutMargins:UIEdgeInsetsZero];
    }
    
}
@end