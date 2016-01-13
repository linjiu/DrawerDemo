//
//  BaseViewController.m
//  drawerDemo
//
//  Created by 09 on 16/1/13.
//  Copyright © 2016年 yifan. All rights reserved.
//

#import "BaseViewController.h"

#import "BaseNavigationViewController.h"
#import "drawerButton.h"

//引入 tabbar 上控制的控制器
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

@interface BaseViewController ()
{
    UIImageView *_tabBarView;//自定义的覆盖原先的tarbar的控件
    
    drawerButton *_previousBtn;//记录前一次选中的按钮
}
@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView* obj in self.tabBar.subviews) {
        if (obj != _tabBarView) {
                //_tabBarView 应该单独封装。
            [obj removeFromSuperview];
        }
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tabBarView = [[UIImageView alloc]initWithFrame:self.tabBar.bounds];
    _tabBarView.userInteractionEnabled = YES;
    _tabBarView.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:_tabBarView];
    
    OneViewController *oneVC = [[OneViewController alloc]init];
    _one = [[BaseNavigationViewController alloc]initWithRootViewController:oneVC];
    
    TwoViewController *twoVC = [[TwoViewController alloc]init];
    _two = [[BaseNavigationViewController alloc]initWithRootViewController:twoVC];
    
    ThreeViewController *threeVC = [[ThreeViewController alloc]init];
    _three = [[BaseNavigationViewController alloc]initWithRootViewController:threeVC];
    
    FourViewController *fourVC = [[FourViewController alloc]init];
    _four = [[BaseNavigationViewController alloc]initWithRootViewController:fourVC];
    
    self.viewControllers = [NSArray arrayWithObjects:_one, _two, _three, _four,nil];
    
    //自行引入图片
    [self creatButtonWithNormalName:@"normal" andSelectName:@"selected" andTitle:@"推荐" andIndex:0];
    [self creatButtonWithNormalName:@"normal" andSelectName:@"selected" andTitle:@"分类" andIndex:1];
    [self creatButtonWithNormalName:@"normal" andSelectName:@"selected" andTitle:@"发现" andIndex:2];
    [self creatButtonWithNormalName:@"normal" andSelectName:@"selected" andTitle:@"我的" andIndex:3];
    drawerButton *button = _tabBarView.subviews[0];
    
    [self changeViewController:button];
    
}

#pragma mark 创建一个按钮
- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index{
    
    drawerButton * customButton = [drawerButton buttonWithType:UIButtonTypeCustom];
    customButton.tag = 1000 + index;
    
    CGFloat buttonW = _tabBarView.frame.size.width / 4;
    CGFloat buttonH = _tabBarView.frame.size.height;
    
    customButton.frame = CGRectMake(buttonW * index, 0, buttonW, buttonH);
    
    [customButton addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton setTintColor:[UIColor grayColor]];
    //设置点击前后图片
    [customButton setImage:[[UIImage imageNamed:normal] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]forState:UIControlStateNormal];
    [customButton setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    
    //设置点击前后字体颜色
    [customButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [customButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    
    customButton.imageView.contentMode = UIViewContentModeCenter;
    customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    customButton.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [_tabBarView addSubview:customButton];
    
    if(index == 0)//设置第一个选择项。（默认选择项） wsq
    {
        _previousBtn = customButton;
        _previousBtn.selected = YES;
    }
    
}

#pragma mark 按钮被点击时调用
- (void)changeViewController:(drawerButton *)sender
{
    if(self.selectedIndex != sender.tag - 1000){
        self.selectedIndex = sender.tag - 1000; //切换不同控制器的界面
        _previousBtn.selected = ! _previousBtn.selected;
        _previousBtn = sender;
        _previousBtn.selected = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
