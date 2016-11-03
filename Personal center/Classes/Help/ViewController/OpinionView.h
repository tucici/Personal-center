//
//  OpinionView.h
//  Personal center
//
//  Created by mac1 on 16/9/21.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OpinionViewDelegate
@required
/**
 *OpinionView action delegate
 */
-(void)opinionViewAction;
@end
@interface OpinionView : UIView
@property (nonatomic, weak) id<OpinionViewDelegate>delegate;
@property (nonatomic, assign) CGFloat HToBottom_textView;   /*textview底部 到屏幕底部的距离*/
@property (nonatomic, assign) BOOL writed;                  /*textview  是否有输入内容*/


/**
 *点击反馈，清除TextView内容
 */
-(void)clearOpinionViewText;


@end
