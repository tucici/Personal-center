//
//  DynamicModel.m
//  Personal center
//
//  Created by mac1 on 16/11/4.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import "DynamicViewModel.h"
#import "CellModel.h"
@implementation DynamicViewModel
- (id)init{
    self = [super init];
    if (self) {
        [self initializeDynamicList];
    }
    
    return self;
}

- (void)initializeDynamicList{
    _dynamicData = [[NSMutableDictionary alloc]init];
    NSMutableArray *public = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",nil];
    _publicData = [NSMutableArray array];
    _privateData = [NSMutableArray array];
    for (int i = 0; i< public.count ; i++) {
        CellModel *model = [CellModel modelWithDictionary:@{@"image":[public objectAtIndex:i]}];
        [_publicData addObject:model];
    }
    NSLog(@"_public    %@  ------> %p ",_publicData , &_publicData);
    //    NSMutableArray *public = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"5",@"3",@"1",@"2",@"3",@"4",@"5",@"6",@"5",@"3",@"6",@"5",@"3",@"1",@"2",@"3",@"4",@"5",@"6",@"5",@"3",@"6",@"5",@"3",@"1",@"2",@"3",@"4",@"5",@"6",@"5",@"3",nil];
    
    NSMutableArray *private = [NSMutableArray arrayWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"06",@"01",@"02",@"03",@"04",@"05",@"06",@"06",@"03",@"04",@"05",@"06",@"06",@"01",@"02",@"03",@"04",@"05",@"06",@"06",@"03",@"04",@"05",@"06",@"06",@"01",@"02",@"03",@"04",@"05",@"06",@"06", nil];
    
    for (int i = 0; i< private.count; i++) {
        CellModel *model = [CellModel modelWithDictionary:@{@"image":[private objectAtIndex:i]}];
        [_privateData addObject:model];
    }
    [_dynamicData setObject:public forKey:@"public"];
    [_dynamicData setObject:private forKey:@"private"];
    
}
@end
