//
//  ViewController.m
//  Runtime小结
//
//  Created by 迦南 on 2018/2/24.
//  Copyright © 2018年 迦南. All rights reserved.
//

#import "ViewController.h"
#import "Runtime_Basic.h"
#import "Runtime_Change.h"
#import "StatusItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    Runtime_BasicTest();
//    Runtime_ChangeMethod();
    Runtime_AddMethod();
//    Runtime_AddProperty();
//    [self DictToModel];
}

// 基本调用
void Runtime_BasicTest() {
    [Runtime_Basic basicCall];
}

// 利用runtime交换系统方法
void Runtime_ChangeMethod() {
    UIImage *img = [UIImage imageNamed:@"starLight"];
}

// 利用Runtime动态添加方法
void Runtime_AddMethod() {
    [Runtime_Change addMethods];
}

// 利用Runtime动态添加属性
void Runtime_AddProperty() {
    [Runtime_Change addProperty];
}

// 利用runtime模拟MJExtension，字典转模型
- (void)DictToModel {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    StatusItem *item = [StatusItem itemWithDict:dict];
    NSLog(@"%@", [item class]);
}
@end
