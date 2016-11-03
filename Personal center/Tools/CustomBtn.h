//
//  CustomBtn.h
//  Personal center
//
//  Created by mac1 on 16/10/27.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomBtn : UIButton
@property (nonatomic, copy)NSString *detailText;
- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title;
@end
