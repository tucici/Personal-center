//
//  CustomBtn.m
//  Personal center
//
//  Created by mac1 on 16/10/27.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "CustomBtn.h"
@interface CustomBtn(){
}
@property (nonatomic, strong) UILabel *detailLabel;
@end
@implementation CustomBtn

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        
        [self initializeDetailLabel];
        
    }
    return self;
}

- (void)initializeDetailLabel{
    
    _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
    _detailLabel.textColor = [UIColor blackColor];
    [self addSubview:_detailLabel];
    
}

- (void)setDetailText:(NSString *)detailText{
    
    if (![_detailText isEqualToString:detailText]) {
        _detailText = detailText;
        _detailLabel.text = detailText;
        [self refreshDetailLabel];
    }
    
    
}

- (void)refreshDetailLabel{
    
    [_detailLabel sizeToFit];
    _detailLabel.center = CGPointMake(self.bounds.size.width * 0.5, _detailLabel.frame.size.height * 0.5);
    if (![_detailText isEqualToString:@""]) {
        self.titleEdgeInsets = UIEdgeInsetsMake(self.bounds.size.height * 0.5, 0.0, 0.0, 0.0);
    }
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
