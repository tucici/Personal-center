//
//  NSMutableArray+avoidDuplication.m
//  Personal center
//
//  Created by mac1 on 16/11/8.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import "NSMutableArray+avoidDuplication.h"

@implementation NSMutableArray (avoidDuplication)
- (void)addNewObject:(id)anObject{
    
    for (NSString *str in self) {
        if ([str isEqualToString:(NSString *)anObject]) {
            return;
        }
    }
    [self addObject:anObject];
    NSLog(@"self  %@",self);
}
@end
