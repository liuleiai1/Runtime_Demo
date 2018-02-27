//
//  UIImage+ChangeMethod.m
//  runtime基本使用
//
//  Created by 迦南 on 2017/9/12.
//  Copyright © 2017年 迦南. All rights reserved.
//

#import "UIImage+ChangeMethod.h"

@implementation UIImage (ChangeMethod)

+ (void)load {
    // 获取类方法
    Method method1 = class_getClassMethod(self, @selector(imageNamed:));
    Method method2 = class_getClassMethod(self, @selector(ll_imageNamed:));
    
    // 利用rumtime交换两个方法
    method_exchangeImplementations(method1, method2);
}
    
+ (UIImage *)ll_imageNamed:(NSString *)name {

    UIImage *image = [UIImage ll_imageNamed:name];
    
    if (image) {
        NSLog(@"加载成功");
    } else {
        NSLog(@"加载失败");
    }
    
    return image;
}
    
@end
