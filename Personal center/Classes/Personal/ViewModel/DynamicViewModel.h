//
//  DynamicModel.h
//  Personal center
//
//  Created by mac1 on 16/11/4.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CellModel;

@interface DynamicViewModel : NSObject
@property (nonatomic, strong) NSMutableDictionary *dynamicData;

@property (nonatomic, strong) NSMutableArray <CellModel *> *publicData;

@property (nonatomic, strong) NSMutableArray <CellModel *> *privateData;


@end
