//
//  LeftSortsViewController.m
//  LGDeckViewController
//
//  Created by jamie on 15/3/31.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//

#import "LeftSortsViewController.h"

#import "AppDelegate.h"
#import "otherViewController.h"
#import "XLCATransAnimation.h"

@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"test01.jpg"];
    [self.view addSubview:imageview];
    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = 0;
    [self.view addSubview:tableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    
    
    //设置侧边栏的  图片 + 文字标题
    if (indexPath.row == 0) {
        cell.textLabel.text = @"111111";
        cell.imageView.layer.masksToBounds = YES;
        cell.imageView.layer.cornerRadius = 5;
        cell.imageView.image = [UIImage imageNamed:@"1"];
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"222222";
        cell.imageView.layer.masksToBounds = YES;
        cell.imageView.layer.cornerRadius = 5;
        cell.imageView.image = [UIImage imageNamed:@"2"];
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"333333";
        cell.imageView.layer.masksToBounds = YES;
        cell.imageView.layer.cornerRadius = 5;
        cell.imageView.image = [UIImage imageNamed:@"3"];
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"444444";
        cell.imageView.image =[UIImage imageNamed:@"4"];
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"555555";
        cell.imageView.image = [UIImage imageNamed:@"5"];
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"666666";
        cell.imageView.image = [UIImage imageNamed:@"6"];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIViewController *vc = nil;
    
    if (indexPath.row == 0) {

    } else if (indexPath.row == 1) {
    } else if (indexPath.row == 2) {
    } else if (indexPath.row == 3) {
    } else if (indexPath.row == 4) {
    } else if (indexPath.row == 5) {
        
        //要执行的方法都写在这里：
        //若要跳转
        //vc = ;
        
    }
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
        
    });
    
    CGFloat tabBarIndex = tempAppDelegate.tabBar.selectedIndex;
    UINavigationController *navC = nil;
    
    //跳转界面 记录哪个界面跳转过来 就用哪个界面的 navC
    if (tabBarIndex == 0) {
        navC = tempAppDelegate.tabBar.one;
    }else if (tabBarIndex == 1){
        navC = tempAppDelegate.tabBar.two;
    }else if (tabBarIndex == 3){
        navC = tempAppDelegate.tabBar.three;
    }else if (tabBarIndex == 4) {
        navC = tempAppDelegate.tabBar.four;
    }
    
    //动画效果
    CATransition *transition = [XLCATransAnimation transitionType:@"rippleEffect" Subtype:kCATransitionFromRight Delegate:self];
    
    [navC.view.layer addAnimation:transition forKey:nil];
    
    //跳转界面
    [navC pushViewController:vc animated:NO];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 180;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
@end
