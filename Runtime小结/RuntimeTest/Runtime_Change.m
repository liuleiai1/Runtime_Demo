//
//  Runtime_Change.m
//  Runtime小结
//
//  Created by 迦南 on 2018/2/26.
//  Copyright © 2018年 迦南. All rights reserved.
//

#import "Runtime_Change.h"
#import "Dog.h"
#import "NSObject+Property.h"

@implementation Runtime_Change

+ (void)addMethods {
    /*
     Runtime(动态添加方法):OC都是懒加载机制,只要一个方法实现了,就会马上添加到方法列表中.
     
     美团有个面试题?有没有使用过performSelector,什么时候使用?动态添加方法的时候使用过?怎么动态添加方法?用runtime?为什么要动态添加方法?
     */
    
    Dog *dog = [[Dog alloc] init];
    [dog performSelector:@selector(eat)];
    [dog performSelector:@selector(run:) withObject:@10];
}

+ (void)addProperty {
    NSObject *obj = [[NSObject alloc] init];
    obj.name = @"ray";
    NSLog(@"%@", obj.name);
}

@end
