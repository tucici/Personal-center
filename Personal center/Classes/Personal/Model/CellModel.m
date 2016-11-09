//
//  CollectionModel.m
//  Personal center
//
//  Created by mac1 on 16/11/8.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dic {
    return [[self alloc] initWithDictionary:dic];
}

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _imageName = [dic objectForKey:@"image"];
        _isPicked = NO;
    }
    return self;
}
@end
