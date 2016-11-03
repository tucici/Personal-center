//
//  HeadPortraitView.h
//  Personal center
//
//  Created by mac1 on 16/9/19.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeadPortraitView;
@protocol HeadPortraitViewDelegate <NSObject>
@required
/**
 *点击个人头像，事件响应代理
 */
-(void) clickedHeadPortrait;
@end

@interface HeadPortraitView : UIView
@property (nonatomic, assign) id<HeadPortraitViewDelegate>delegate;



/**
 *改变个人头像
 */
-(void)changeHeadPortrait:(NSString *)string;
@end
