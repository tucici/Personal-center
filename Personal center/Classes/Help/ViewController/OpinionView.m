//
//  OpinionView.m
//  Personal center
//
//  Created by mac1 on 16/9/21.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#define space 20.0
#import "Header.h"
#import "OpinionView.h"
@interface OpinionView()<UITextViewDelegate>{
    UITextView *_textview;               /*留言反馈栏*/
    UILabel *_label;                     /*留言反馈栏顶部标识*/
    UILabel *_opinionLabel;              /*意见反馈开头半透明字体label*/
}
@end
@implementation OpinionView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:backViewColor];
        
        
        /*initializeLabel*/
        [self initializeLabel];
        
        /*initializeTextView*/
        
        [self initializeTextView];
        
        /*initializeOpinionLabel*/
        [self initializeOpinionLabel];
    }
    return self;
    
}
-(void)initializeLabel{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(space, 10.0, 0.0, 0.0)];
    [_label setNumberOfLines:0];
    [_label setText:@"意见填写"];
    [_label setTextColor:[UIColor blackColor]];
    [_label sizeToFit];
    [self addSubview:_label];
}
-(void)initializeTextView{
    
    CGFloat height = self.frame.size.height - CGRectGetMaxY(_label.frame) - space - 30 - buttonHeight;
    
    
    _textview = [[UITextView alloc]initWithFrame:CGRectMake(space, CGRectGetMaxY(_label.frame), view_width - space * 2, height)];
    _textview.layer.borderWidth = 1.0;
    _textview.layer.borderColor = [UIColor grayColor].CGColor;
    _textview.delegate = self;
    _textview.returnKeyType = UIReturnKeyDone;
    [self addSubview:_textview];
    _HToBottom_textView = CGRectGetMaxY(_label.frame) + height + self.frame.origin.y;
}

-(void)initializeOpinionLabel{
    _opinionLabel = [[UILabel alloc]initWithFrame:CGRectMake(space + 5.0, CGRectGetMinY(_textview.frame) + 5.0, 0.0, 0.0)];
    [_opinionLabel setNumberOfLines:0];
    [_opinionLabel setText:@"您的意见对我们很重要"];
    [_opinionLabel setTextColor:[UIColor lightGrayColor]];
    [_opinionLabel sizeToFit];
    [self addSubview:_opinionLabel];
}

-(BOOL)resignFirstResponder{
    [super resignFirstResponder];
    [_textview resignFirstResponder];
    return NO;
}
/*点击反馈，清空TextView内容*/
-(void)clearOpinionViewText{
    _writed = NO;
    _textview.text = @"";
    _opinionLabel.text = @"你的意见对我们很重要";
    
}


#pragma mark - UITextViewDelegate
-(void)textViewDidChange:(UITextView *)textView{
    //判断买家留言输入的字数，如超过设定字数则弹出警告框
    if (_textview.text.length == 0) {
        _writed = NO;
        _opinionLabel.text = @"你的意见对我们很重要";
        
    }else{
        _writed = YES;
        _opinionLabel.text = @"";
    }
    if (_textview.text.length >31) {
        NSString *string1 = _textview.text;
        NSString *string2 = [string1 substringToIndex:30];
        _textview.text = string2;
        [self popAlertView];
    }
}
/*点击键盘确定按钮，完成输入*/
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [_textview resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"didbeginediting~~~~~~~~~~~~");
    
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
}
-(void)popAlertView{
    [self.delegate opinionViewAction];
    
}
@end
