//
//  AppDelegate.h
//  drawerDemo
//
//  Created by 09 on 16/1/13.
//  Copyright © 2016年 yifan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSlideViewController.h"
#import "BaseViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) BaseViewController *tabBar;

@end

