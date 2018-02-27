//
//  NSObject+Model.h
//  runtime基本使用
//
//  Created by 迦南 on 2017/9/12.
//  Copyright © 2017年 迦南. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

// 字典转模型
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
