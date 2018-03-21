//
//  Dog.m
//  runtime基本使用
//
//  Created by 迦南 on 2017/9/12.
//  Copyright © 2017年 迦南. All rights reserved.
//

#import "Dog.h"
#import <objc/message.h>

@implementation Dog

// 任何方法默认都有两个隐式参数,self,_cmd
void method1(id self, SEL _cmd) {
    
    NSLog(@"吃东西");
}
  
void method2(id self, SEL _cmd, NSNumber *meter) {
    
    NSLog(@"跑了%@公里", meter);
}
    
// 什么时候调用:只要一个对象调用了一个未实现的方法就会调用这个方法,进行处理
// 作用:动态添加方法,处理未实现
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    if (sel == NSSelectorFromString(@"eat")) {
        // eat
        // class: 给哪个类添加方法
        // SEL: 添加哪个方法
        // IMP: 方法实现 => 函数 => 函数入口 => 函数名
        // type: 方法类型
        class_addMethod(self, sel, (IMP)method1, "v@");

        return YES;
    }

    if (sel == NSSelectorFromString(@"run:")) {

        class_addMethod(self, sel, (IMP)method2, "v@:@");

        return YES;
    }
    
    return [super resolveInstanceMethod:sel];    
}

// 消息转发
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    return nil;
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}
/*
 *  Objective-C 的运行时会给你三次拯救程序的机会：
 
    Method resolution
    Fast forwarding
    Normal forwarding
    每一个没有调取，则会按顺序执行下一个方法去找寻函数的实现
 **/
@end
