//
//  HelpViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/20.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#define kCursorVelocity 1.0f/8.0f
#import "Header.h"
#import "HelpViewController.h"
@interface HelpViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>{
    UIView *_titleview_help;             /*导航栏背景*/
    UIButton *_back_help;                /*返回*/
    UIButton *_feedback;                 /*反馈*/
    UILabel *_title_help;                /*ViewTitle*/
    UILabel *_opinionLabel;              /*意见反馈开头半透明字体label*/
    UITextView *_textview;               /*留言反馈栏*/
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
    [self initializeOpinionLabel];
    
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
    _textview = [[UITextView alloc]initWithFrame:CGRectMake(20.0, CGRectGetMaxY(_tableview_help.frame) + 10.0, view_width - 40.0, height)];
    _textview.layer.borderWidth = 1.0;
    _textview.layer.borderColor = [UIColor blackColor].CGColor;
    _textview.delegate = self;
    _textview.font = [UIFont fontWithName:@"Arial" size:20];
    _textview.returnKeyType = UIReturnKeyDone;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [_textview addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [_textview addGestureRecognizer:tap];
    
    [self.view addSubview:_textview];
    
}
/*initializeOpinionLabel*/
-(void)initializeOpinionLabel{
    
    _opinionLabel = [[UILabel alloc]initWithFrame:CGRectMake(20.0, CGRectGetMinY(_textview.frame) + 5.0, 0.0, 0.0)];
    [_opinionLabel setNumberOfLines:0];
    [_opinionLabel setText:@"你的意见对我们很重要"];
    [_opinionLabel setTextColor:[UIColor lightGrayColor]];
    [_opinionLabel sizeToFit];
    [self.view addSubview:_opinionLabel];
    
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidChangeFrameNotification object:nil];
}
-(void)keyboardWasShown:(NSNotification *)notification{
    NSDictionary * info = [notification userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    keyboardHeight  = [value CGRectValue].size.height;
    CGFloat animationTime  = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];

//    CGFloat minn =view_height - CGRectGetMaxY(_textview.frame);
//    NSLog(@"minn  %f",minn);
//    void(^animation)(void) = ^void(void){
//     _textview.transform = CGAffineTransformMakeTranslation(0, - keyboardHeight);
//    };
    
//    if (animationTime > 0) {
//        [UIView animateWithDuration:animationTime animations:animation];
//    } else {
//        animation();
//    }
    NSLog(@"keyboarHeight  : %f",keyboardHeight);
    
}
#pragma  mark UIButtonAction
-(void)backActionAtHelpVC:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)feedbackActionAtHelpVC:(UIButton *)sender{
    NSLog(@"接入意见反馈接口");
}
#pragma  mark 手势事件
-(void)tap:(UITapGestureRecognizer *)sender{
  
    NSLog(@"tap~~~~~~~~~~~");
    _textview.editable = YES;
    [_textview becomeFirstResponder];
    
      _textview.transform = CGAffineTransformMakeTranslation(0, - 126);
}
-(void)pan:(UIPanGestureRecognizer *)sender{
    CGPoint point = [sender locationInView:_textview];
    NSLog(@"%f     %f",point.x, point.y);
    NSRange startRange;
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        startRange = _textview.selectedRange;
    }
    
    CGFloat cursorLocation = MAX(startRange.location+(NSInteger)([sender translationInView:_textview].x*kCursorVelocity), 0);
    NSRange selectedRange = {cursorLocation, 0};
    _textview.selectedRange = selectedRange;
    
}

#pragma mark - UITextViewDelegate
-(void)textViewDidChange:(UITextView *)textView{
    //判断买家留言输入的字数，如超过设定字数则弹出警告框
    if (_textview.text.length == 0) {
        _opinionLabel.text = @"你的意见对我们很重要";
        
    }else{
        _opinionLabel.text = @"";
    }
    if (_textview.text.length >31) {
    }
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [_textview resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"didbeginediting~~~~~~~~~~~~");
    //    CGFloat minn =view_height - CGRectGetMaxY(_textview.frame);
    //    NSLog(@"minn  %f",minn);
    //    _textview.transform = CGAffineTransformMakeTranslation(0, - 200);
    //    self.detailTableView.scrollEnabled = YES;
    //    [self.detailTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:4] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    //    self.detailTableView.scrollEnabled = NO;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    //    self.detailTableView.scrollEnabled = YES;
    //    [self.detailTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:4] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    //    self.detailTableView.scrollEnabled = NO;
    if (_textview.text.length >31) {
        UIAlertView *alert  = [[UIAlertView alloc]initWithTitle:@"提示" message:@"字数限制在30字以内" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        
        NSString *string1 = _textview.text;
        NSString *string2 = [string1 substringToIndex:30];
        _textview.text = string2;
    }
    _textview.editable = NO;
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
    NSLog(@"点击帮助与反馈");
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