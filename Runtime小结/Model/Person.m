//
//  Person.m
//  runtime基本使用
//
//  Created by 迦南 on 2017/9/12.
//  Copyright © 2017年 迦南. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat {
    NSLog(@"吃");
}
    
- (void)run:(NSInteger)metre {
    
    NSLog(@"跑了%ld公里",metre);
}

- (void)personalMethod {

    NSLog(@"runtime可以调用私有方法");
}
    
@end
