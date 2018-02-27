//
//  NSObject+Property.m
//  runtime基本使用
//
//  Created by 迦南 on 2017/9/12.
//  Copyright © 2017年 迦南. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

- (void)setName:(NSString *)name {
    
    // object:给哪个对象添加属性
    // key:属性名称
    // value:属性值
    // policy:保存策略
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name {
    
    return objc_getAssociatedObject(self, @"name");
}

@end
