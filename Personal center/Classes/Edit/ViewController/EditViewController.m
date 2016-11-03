//
//  EditViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/20.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "EditViewController.h"
#import "UITableViewCell+Category.h"
#define cellH (view_height - statusbarHeight - buttonHeight * 2 - 105) / 9.0  /*cell 的高度*/
#define spacingToLeft 20.0
@interface EditViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>{
    UIView *_titleview_edit;             /*导航栏背景*/
    UIButton *_back_edit;                /*返回*/
    UITableView *_tableview_edit;        /*主题TableView*/
    UILabel *_title_edit;                /*ViewTitle*/
    UILabel *_nickname;                  /*昵称*/
    UIButton *_headview;                 /*头像*/
    UIButton *_man;                      /*男性*/
    UIButton *_woman;                    /*女性*/
    UILabel *_signLabel;                 /*个性签名标签*/
    UITextView *_signView;               /*个性签名*/
    UILabel *_shadowText;                /*个性签名提示*/
    CGFloat keyboardHeight;              /*键盘高度*/
}
@end
@implementation EditViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self registerForKeyboardNotification];
}
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
    
    /*initializePersonalSignature*/
    [self initializePersonalSignature];
    
    /*initializeSignView*/
    [self initializeSignView];
    
    /*initializeShadowText*/
    [self initializeShadowText];
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
    CGFloat height = 25.0 + cellH * 3;
    _tableview_edit = [[UITableView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_back_edit.frame), view_width, height) style:UITableViewStylePlain];
    _tableview_edit.scrollEnabled = NO;
    _tableview_edit.delegate = self;
    _tableview_edit.dataSource = self;
    _tableview_edit.showsVerticalScrollIndicator = NO;
    _tableview_edit.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableview_edit];
    
}

-(void)initializePersonalSignature{
    _signLabel = [[UILabel alloc]initWithFrame:CGRectMake(spacingToLeft, CGRectGetMaxY(_tableview_edit.frame) + spacingToLeft, 0.0, 0.0)];
    [_signLabel setText:@"个性签名"];
    [_signLabel sizeToFit];
    //[label setCenter:CGPointMake(label., <#CGFloat y#>)]
    [self.view addSubview:_signLabel];
}

-(void)initializeSignView{
    _signView = [[UITextView alloc]initWithFrame:CGRectMake(spacingToLeft, CGRectGetMaxY(_signLabel.frame), view_width - spacingToLeft * 2, (view_height - CGRectGetMaxY(_signLabel.frame)) * 0.5)];
    _signView.layer.borderWidth = 1.0;
    _signView.layer.borderColor = [UIColor blackColor].CGColor;
    _signView.returnKeyType = UIReturnKeyDone;
    _signView.delegate = self;
    [self.view addSubview:_signView];
    
    
}
-(void)initializeShadowText{
    _shadowText = [[UILabel alloc]initWithFrame:CGRectMake(spacingToLeft * 0.5, spacingToLeft * 0.5, 0.0, 0.0)];
    [_shadowText setText:@"请输入50字以内的个性签名"];
    [_shadowText setTextColor:[UIColor lightGrayColor]];
    [_shadowText sizeToFit];
    [_signView addSubview:_shadowText];
}
-(void)registerForKeyboardNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHiden:) name:UIKeyboardWillHideNotification object:nil];
    
}
-(void)keyboardWasShown:(NSNotification *)notification{
    NSDictionary * info = [notification userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    keyboardHeight  = [value CGRectValue].size.height;
    CGFloat animationTime  = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    void(^animation)(void) = ^void(void){
        _signView.transform = CGAffineTransformMakeTranslation(0.0, view_height - keyboardHeight - CGRectGetMaxY(_signView.frame));
    };
    
    if (animationTime > 0) {
        [UIView animateWithDuration:animationTime animations:animation];
    } else {
        animation();
    }
    
}
-(void)keyboardWasHiden:(NSNotification *)notification{
    NSDictionary * info = [notification userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    keyboardHeight  = [value CGRectValue].size.height;
    CGFloat animationTime  = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    void(^animation)(void) = ^void(void){
        _signView.transform = CGAffineTransformIdentity;
        
    };
    
    if (animationTime > 0) {
        [UIView animateWithDuration:animationTime animations:animation];
    } else {
        animation();
    }
 
}
#pragma mark UIButtonAction
-(void)backActionAtEditVC:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)changebackimage:(UIButton *)sender{
    NSLog(@"改变头像");
    
}
-(void)selectedWomen:(UIButton *)sender{
    
    _man.selected = NO;
    sender.selected = !sender.selected;
    NSLog(@"选中女性");
}
-(void)selectedMan:(UIButton *)sender{
    _woman.selected = NO;
    sender.selected = !sender.selected;
    NSLog(@"选中男性");
}
#pragma mark UIButtonActionEnd

#pragma mark UITextViewDelegate
-(void)textViewDidChange:(UITextView *)textView{
    //判断买家留言输入的字数，如超过设定字数则弹出警告框
    if (_signView.text.length == 0) {
      _shadowText.text = @"你的意见对我们很重要";
        
    }else{
    _shadowText.text = @"";
    }
    if (_signView.text.length >31) {
        NSString *string1 = _signView.text;
        NSString *string2 = [string1 substringToIndex:30];
        _signView.text = string2;
    
    }
}
/*点击键盘确定按钮，完成输入*/
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [_signView resignFirstResponder];
        return NO;
    }
    return YES;
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
    return 3;
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
            _headview = [[UIButton alloc]initWithFrame:CGRectMake(view_width - 25.0 - cellH, 3.0, cellH - 6.0, cellH - 6.0)];
            [_headview setBackgroundImage:[UIImage imageNamed:@"01"] forState:UIControlStateNormal];
            _headview.layer.cornerRadius = _headview.bounds.size.height * 0.5;
            _headview.layer.borderWidth = 1.0;
            _headview.layer.borderColor = [UIColor blackColor].CGColor;
            _headview.layer.masksToBounds = YES;
            [_headview addTarget:self action:@selector(changebackimage:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:_headview];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
        
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            [cell.textLabel setText:@"昵称"];
            _nickname = [[UILabel alloc]initWithFrame:CGRectMake(view_width - 25.0 - cellH, 0.0, 0.0, 0.0)];
            [_nickname setText:@"刘浩男"];
            [_nickname sizeToFit];
            [_nickname setCenter:CGPointMake(_nickname.center.x, cellH * 0.5)];
            //            [cell setTranslatesAutoresizingMaskIntoConstraints:NO];
            //            [_nickname setTranslatesAutoresizingMaskIntoConstraints:NO];
            //            NSDictionary *dict1 = NSDictionaryOfVariableBindings(_nickname);
            //            [_nickname setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
            [cell addSubview:_nickname];
            //            [cell addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[_nickname(100@200)]-25-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_nickname)]];
            //            [cell addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_nickname]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_nickname)]];
            //             [_nickname setFont:cell.textLabel.font];
            
        }else if (indexPath.row == 1){
            [cell.textLabel setText:@"性别"];
            _woman = [[UIButton alloc]initWithFrame:CGRectMake(view_width - 25.0 - cellH, 3.0, cellH, cellH - 6.0)];
            [_woman setTitle:@"女" forState:UIControlStateNormal];
            [_woman setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_woman setImage:[UIImage imageNamed:@"02"] forState:UIControlStateNormal];
            [_woman setImage:[UIImage imageNamed:@"yes"] forState:UIControlStateSelected];
            
            [_woman addTarget:self action:@selector(selectedWomen:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:_woman];
            [_woman setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, cellH * 0.5)];
            
            
            _man = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMidX(_woman.frame) - cellH - 22, 3.0, cellH, cellH - 6.0)];
            [_man setBackgroundColor:[UIColor purpleColor]];
            [_man setTitle:@"男" forState:UIControlStateNormal];
            [_man setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_man setImage:[UIImage imageNamed:@"04"] forState:UIControlStateNormal];
            [_man setImage:[UIImage imageNamed:@"yes"] forState:UIControlStateSelected];
            [_man setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, cellH * 0.5)];
            
            [_man addTarget:self action:@selector(selectedMan:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:_man];
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
    }
    return 0.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ;
    return cellH;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}


@end
