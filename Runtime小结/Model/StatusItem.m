//
//  StatusItem.m
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 16/3/4.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "StatusItem.h"
#import "NSObject+Model.h"

@implementation StatusItem

+ (instancetype)itemWithDict:(NSDictionary *)dict {

    return [self modelWithDict:dict];
}

+ (NSString *)description {

    NSLog(@"%s", __func__);
    
    return @"description";
}
    
- (NSString *)description {
    
    NSLog(@"%s", __func__);
    
    return @"description";
}
@end
