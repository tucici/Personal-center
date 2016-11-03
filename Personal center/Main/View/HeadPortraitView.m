//
//  HeadPortraitView.m
//  Personal center
//
//  Created by mac1 on 16/9/19.
//  Copyright © 2016年 Tucici. All rights reserved.
//


#import "HeadPortraitView.h"
@interface HeadPortraitView(){
    
    UIImageView *_headImage;          /*个人头像*/
    UIImageView *_gender;             /*性别*/
    
}
@end
@implementation HeadPortraitView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        /*initialize_headImage*/
        [self initializeHeadImage];
        
        /*initialize_gender*/
        [self initGender];
    }
    return self;
}
-(void)initializeHeadImage{
    
    _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
    [_headImage setImage:[UIImage imageNamed:@"1"]];
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.bounds.size.height * 0.5;
    _headImage.layer.borderWidth = 3.0;
    _headImage.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:_headImage];
    
}
-(void)initGender{
    
    CGFloat x_min = CGRectGetMinX(_headImage.frame);
    CGFloat y_min = CGRectGetMinY(_headImage.frame);
    CGFloat r = _headImage.frame.size.height * 0.5;
    CGFloat scale = 1.4142135623731 / 2.0;
    _gender = [[UIImageView alloc]initWithFrame:CGRectMake(r * scale + x_min + r, r * scale + r + y_min, 15.0, 15.0)];
    _gender.center = CGPointMake(r * scale + x_min + r, r * scale + r + y_min);
    [_gender setImage:[UIImage imageNamed:@"3"]];
    _gender.layer.masksToBounds = YES;
    _gender.layer.cornerRadius = _gender.bounds.size.height *0.5;
    _gender.layer.borderWidth = 1.5;
    _gender.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:_gender];
    
}
-(void)changeHeadPortrait:(NSString *)string{
    
    [_headImage setImage:[UIImage imageNamed:string]];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.delegate clickedHeadPortrait];
}
@end
