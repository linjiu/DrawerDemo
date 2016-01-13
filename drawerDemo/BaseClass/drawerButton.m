//
//  drawerButton.m
//  drawerDemo
//
//  Created by 09 on 16/1/13.
//  Copyright © 2016年 yifan. All rights reserved.
//

#import "drawerButton.h"

@implementation drawerButton

//设置抽屉按钮 =  图片 + 文字标题  形式
#pragma mark 设置button内部的image的范围
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.6;
    
    return CGRectMake(0, 5, imageW, imageH);
    
}

#pragma mark 设置button内部的title的范围
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height * 0.6;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
