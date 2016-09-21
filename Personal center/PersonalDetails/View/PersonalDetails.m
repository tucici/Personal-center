//
//  PersonalDetails.m
//  Personal center
//
//  Created by mac1 on 16/9/18.
//  Copyright © 2016年 Tucici. All rights reserved.
//
//#define buttonHeight 40.0
//#define buttonWidth 64.0
#define headPortraitHeight (self.frame.size.height - 3 * buttonHeight)
#import "PersonalDetails.h"
#import "Header.h"
#import "HeadPortraitView.h"
@interface PersonalDetails()<HeadPortraitViewDelegate>{
    
    UIButton *_back;                   /*返回*/
    UIButton *_setting;                /*设置*/
    HeadPortraitView *_headPortrait;   /*个人头像*/
    UIImageView *_gender;              /*性别*/
    UIButton *_focusOn;                /*关注*/
    UIButton *_fans;                   /*粉丝*/
    UIButton *_popularity;             /*人气*/
    UIButton *_private;                /*个人信息私密空间*/
    UIButton *_public;                 /*个人信息公开空间*/
    UIButton *_QRCode;                 /*二维码*/
    UILabel *_name;                    /*个人网名*/
    UILabel *_MeNumber;                /*MeID*/
    UILabel *_signature;               /*个性签名*/
    
}


@end
@implementation PersonalDetails
-(id)initWithFrame:(CGRect)Frame{
    self = [super initWithFrame:Frame];
    if (self) {
        [self setBackgroundColor:backViewColor];
        
        /*initialize_back and _setting*/
        [self initializeBackAndSetting];
        
        /*initialize_headPortrait*/
        [self initializeHeadPortrait];
        
        /*initialize_Detial*/
        [self initializeDetail];
        
        /*initialize_focusOn and _fans and _popularity*/
        [self initializeFocusOnAndFansAndPopularity];
        
        /*initialize_private and _public*/
        [self initializePrivateAndPulic];
    }
    return self;
}
/*===========================================initialize_back and _setting============================================*/
-(void)initializeBackAndSetting{
    _back = [[UIButton alloc]initWithFrame:CGRectMake(0.0, statusbarHeight, buttonHeight, buttonHeight)];
    [_back setTitle:@"back" forState:UIControlStateNormal];
    [_back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_back addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_back];
    
    _setting = [[UIButton alloc]initWithFrame:CGRectMake(view_width - buttonHeight, statusbarHeight, buttonHeight, buttonHeight)];
    [_setting setTitle:@"setting" forState:UIControlStateNormal];
    [_setting setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_setting addTarget:self action:@selector(settingAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_setting];
    
}
/*=============================================initialize_headPortrait==============================================*/
-(void)initializeHeadPortrait{
    
    _headPortrait = [[HeadPortraitView alloc]initWithFrame:CGRectMake(10.0, CGRectGetMaxY(_back.frame), headPortraitHeight, headPortraitHeight)];
    _headPortrait.delegate = self;
    
    [self addSubview:_headPortrait];
    
}
/*====================================initialize_focusOn and _fans and _popularity==================================*/

-(void)initializeFocusOnAndFansAndPopularity{
    
    CGFloat space = (view_width - 3 * buttonWidth) / 6.0;
    CGFloat y_max = CGRectGetMaxY(_headPortrait.frame);
    
    _focusOn = [[UIButton alloc]initWithFrame:CGRectMake(2 * space, y_max, buttonWidth, buttonHeight)];
    [_focusOn setTitle:@"关注" forState:UIControlStateNormal];
    [_focusOn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_focusOn addTarget:self action:@selector(focusOnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_focusOn];
    
    _fans = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_focusOn.frame) + space, y_max, buttonWidth, buttonHeight)];
    [_fans setTitle:@"粉丝" forState:UIControlStateNormal];
    [_fans setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_fans addTarget:self action:@selector(fansAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_fans];
    
    _popularity= [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_fans.frame) + space, y_max, buttonWidth, buttonHeight)];
    [_popularity setTitle:@"人气" forState:UIControlStateNormal];
    [_popularity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_popularity addTarget:self action:@selector(popularityAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_popularity];
    
    
}/*=============================================initialize_Detial===================================================*/
-(void)initializeDetail{
    _name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headPortrait.frame) + 10.0, CGRectGetMinY(_headPortrait.frame) + 10.5, 0.0, 0.0)];
    [_name setNumberOfLines:0];
    _name.text = @"Mike Jean";
    [_name setFont:[UIFont fontWithName:@"Arial" size:17]];
    [_name sizeToFit];
    [self addSubview:_name];
    
    _MeNumber = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_name.frame) , CGRectGetMaxY(_name.frame) + 10.0 , 0.0, 0.0)];
    [_MeNumber setNumberOfLines:0];
    [_MeNumber setTextColor:[UIColor lightGrayColor]];
    _MeNumber.text = @"Me号:9871001";
    [_MeNumber setFont:[UIFont fontWithName:@"Arial" size:12]];
    [_MeNumber sizeToFit];
    [self addSubview:_MeNumber];
    
    _signature = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_name.frame), CGRectGetMaxY(_MeNumber.frame) + 10.0, 0.0, 0.0)];
    [_signature setNumberOfLines:0];
    [_signature setTextColor:[UIColor lightGrayColor]];
    _signature.text = @"My life is now,don`t let me waiting.";
    [_signature setFont:[UIFont fontWithName:@"Arial" size:12]];
    [_signature sizeToFit];
    [self addSubview:_signature];
    
    _QRCode = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_name.frame) + 10, CGRectGetMinY(_name.frame), buttonHeight / 2, buttonHeight / 2)];
    [_QRCode setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [_QRCode addTarget:self action:@selector(loadingQRCode:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_QRCode];
    
}
/*====================================initialize_private and _public==================================*/
-(void)initializePrivateAndPulic{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_focusOn.frame), view_width, 1.0)];
    [line setBackgroundColor:[UIColor grayColor]];
    [self addSubview:line];
    CGFloat space = (view_width - 2 * buttonWidth) / 5.0;
    _public = [[UIButton alloc]initWithFrame:CGRectMake(2 * space, CGRectGetMaxY(line.frame), buttonWidth, self.frame.size.height - CGRectGetMaxY(line.frame))];
    [_public setTitle:@"Public" forState:UIControlStateNormal];
    [_public setBackgroundColor:[UIColor grayColor]];
    [_public addTarget:self action:@selector(publicAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_public];
    
    _private = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_public.frame) + space, CGRectGetMaxY(line.frame), buttonWidth, self.frame.size.height - CGRectGetMaxY(line.frame))];
    [_private setTitle:@"Private" forState:UIControlStateNormal];
    [_private setBackgroundColor:[UIColor grayColor]];
    [_private addTarget:self action:@selector(privateAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_private];
    
}

-(void)didChoosedHeadPortraitView:(NSString *)string{
    [_headPortrait changeHeadPortrait:string];
    
}

#pragma UIButtonAciton
-(void)backAction:(UIButton *)sender{
    [self.delegate personalDetailsAcitonWith:PersonalEventBack];
}
-(void)settingAction:(UIButton *)sender{
    [self.delegate personalDetailsAcitonWith:PersonalEventSetting];
    
}
-(void)loadingQRCode:(UIButton *)sender{
    [self.delegate personalDetailsAcitonWith:PersonalEventQRCode];
}
-(void)focusOnAction:(UIButton *)sender{
    [self.delegate personalDetailsAcitonWith:PersonalEventFocusOn];
    
}
-(void)fansAction:(UIButton *)sender{
    [self.delegate personalDetailsAcitonWith:PersonalEventFans];
}
-(void)popularityAction:(UIButton *)sender{
    [self.delegate personalDetailsAcitonWith:PersonalEventPopularity];
}
-(void)publicAction:(UIButton *)sender{
    [self.delegate personalDetailsAcitonWith:PersonalEventPublic];
}
-(void)privateAction:(UIButton *)sender{
    [self.delegate personalDetailsAcitonWith:PersonalEventPrivate];
}
#pragma mark HeadPortraitViewDelegate
-(void)clickedHeadPortrait{
    [self.delegate personalDetailsAcitonWith:PersonalEventHeadprotrait];
}
@end
