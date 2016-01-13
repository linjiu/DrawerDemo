//
//  XLCATransAnimation.h
//  Booker
//
//  Created by 09 on 15/11/17.
//  Copyright © 2015年 yifan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XLCATransAnimation : NSObject

//切换视图动画
+(CATransition *)transitionType:(NSString * const)type Subtype:(NSString * const) subtype Delegate:(id) delegate;

@end
