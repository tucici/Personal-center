//
//  UITableViewCell+Category.h
//  Personal center
//
//  Created by mac1 on 16/10/12.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    left,
    middle,
    right
}positionType;
@interface UITableViewCell (Category)
-(void)addButtonWith:(positionType)positon;
@end
