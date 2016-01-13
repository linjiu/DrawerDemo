//
//  XLCATransAnimation.m
//  Booker
//
//  Created by 09 on 15/11/17.
//  Copyright © 2015年 yifan. All rights reserved.
//

#import "XLCATransAnimation.h"

@implementation XLCATransAnimation



//切换视图动画
+(CATransition *)transitionType:(NSString * const)type Subtype:(NSString * const) subtype Delegate:(id) delegate{
    
    /*1.type的类型(动画效果)
     @“cube"立体 
     @“moveIn” 推出  
     @"reveal”平推 
     @"fade"(default) 
     @“pageCurl” 向上翻一页 
     @“pageUnCurl”向下翻一页
     @"suckEffect”抽布 
     @"rippleEffect"波纹 
     @"oglFlip”平板翻转
     */
    
    /*2.subtype的类型(动画方向)
     kCATransitionFromRight;
     kCATransitionFromLeft;
     kCATransitionFromTop;
     kCATransitionFromBottom;
     */
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = type;
    transition.subtype = subtype;
    transition.delegate = delegate;
    
    //return transition;
    return nil;
    
}

@end
