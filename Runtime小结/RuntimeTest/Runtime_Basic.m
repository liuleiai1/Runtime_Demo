//
//  Runtime_Basic.m
//  runtime基本使用
//
//  Created by 迦南 on 2018/2/24.
//  Copyright © 2018年 迦南. All rights reserved.
//

#import "Runtime_Basic.h"
#import "Person.h"

@implementation Runtime_Basic

// runtime发送消息机制

// 解决消息机制方法提示步骤
// 查找build setting -> 搜索msg

/*
 方法调用流程
 怎么去调用eat方法 ,对象方法:类对象的方法列表 类方法:元类中方法列表
 1.通过isa去对应的类中查找
 2.注册方法编号
 3.根据方法编号去查找对应方法
 4.找到只是最终函数实现地址,根据地址去方法区调用对应函数
 */

+ (void)basicCall {
    // Runtime方式创建类
    createClass();
    // Runtime方式发送消息
    sendMessage();
}

void createClass() {
    // 创建Person对象的两种写法
    // Person *p = [Person alloc];
    //    Person *p = objc_msgSend([Person class], @selector(alloc));
    
    // 获取类
    id class = objc_getClass("Person");
    // SEL是selector在 Objc 中的表示
    SEL sel = sel_registerName("alloc");
    // 发送消息
    Person *p = objc_msgSend(class, sel);
    
    
    
    // p = [p init];
    //    p = objc_msgSend(p, @selector(init));
    p = objc_msgSend(p, sel_registerName("init"));
    
    NSLog(@"%@", p);
    
}

void sendMessage() {
    
    Person *p = [[Person alloc] init];
    
    // 发送消息机制的方法
    //    [p eat];
    //    [p performSelector:@selector(eat)];
    //    objc_msgSend(p, @selector(eat));
    objc_msgSend(p, sel_registerName("eat"));
    
    
    
    // 带参数的方法调用
    //    [p run:10];
    //    [p performSelector:@selector(run:) withObject:@(10)];
    objc_msgSend(p, @selector(run:), 10);
    
    
    
    // 调用私有api
//        [p performSelector:@selector(personalMethod)];
//        objc_msgSend(p, @selector(personalMethod));
    objc_msgSend(p, sel_registerName("personalMethod"));
}

@end
