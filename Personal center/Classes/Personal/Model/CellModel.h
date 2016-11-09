//
//  CollectionModel.h
//  Personal center
//
//  Created by mac1 on 16/11/8.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, assign) BOOL  isPicked;


+ (instancetype)modelWithDictionary:(NSDictionary *)dic;

@end
