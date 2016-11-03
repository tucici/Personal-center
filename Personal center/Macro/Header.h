//
//  Header.h
//  Personal center
//
//  Created by mac1 on 16/9/14.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#ifndef Header_h
#define Header_h
#define view_bounds ([[UIScreen mainScreen]bounds])
#define view_width  view_bounds.size.width
#define view_height view_bounds.size.height
#define statusbarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define buttonHeight 40.0
#define buttonWidth 64.0
#define cellHeight (view_height - statusbarHeight - buttonHeight * 2 - 105) / 9.0
/*==================================*Color*================================*/
#define collectionCellItemColor [UIColor colorWithRed:54.0 / 255 green:54.0 / 255  blue:54.0/255 alpha:1]
#define backViewColor [UIColor colorWithRed:242.0 / 255 green:242.0 / 255  blue:242.0/255 alpha:1]
#define mainColor [UIColor colorWithRed:104.0 / 255 green:224.0 / 255  blue:209.0/255 alpha:1]
#define titleViewColor [UIColor colorWithRed:250.0 / 255 green:250.0 / 255  blue:250.0/255 alpha:1]
#endif /* Header_h */
