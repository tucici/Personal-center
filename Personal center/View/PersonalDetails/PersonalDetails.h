//
//  PersonalDetails.h
//  Personal center
//
//  Created by mac1 on 16/9/18.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *个人中心事件类型
 */
typedef enum {
    PersonalEventBack = 0,
    PersonalEventSetting,
    PersonalEventHeadprotrait,
    PersonalEventFocusOn,
    PersonalEventFans,
    PersonalEventPopularity,
    PersonalEventPrivate,
    PersonalEventPublic,
    PersonalEventQRCode
    
}PersonalEventType;
@class PersonalDetails;
@protocol PersonalDetailsDelegate <NSObject>
@required

/**
 *选择个人头像
 */
-(void)personalDetailsAcitonWith:(PersonalEventType)type;
@end

@interface PersonalDetails : UIView
@property (nonatomic, assign) id<PersonalDetailsDelegate>delegate;
@property (nonatomic, assign) PersonalEventType EventType;
/**
 *已经选好个人头像
 */
-(void)didChoosedHeadPortraitView:(NSString *)string;
@end
