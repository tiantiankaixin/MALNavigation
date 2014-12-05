//
//  TestViewController.m
//  CustomBarItemDemo
//
//  Created by wangtian on 14-11-22.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import "TestViewController.h"
#import "UINavigationItem+CustomItem.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISearchBar *search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    search.searchBarStyle = UISearchBarStyleMinimal;
    search.placeholder = @"搜索";
   [self.navigationItem setItemWithCustomView:search itemType:left];
//    //用图片设置leftItem
//    [self.navigationItem setItemWithImage:@"test1.png" size:CGSizeMake(48/2, 26/2) itemType:left];
    
    //用文字设置centerItem
    [self.navigationItem setItemWithTitle:@"自定义item" titleColor:[UIColor whiteColor] fontSize:16 itemType:center];
    
    //添加多个item
    CustomBarItem *rightItem1 = [CustomBarItem itemWithImage:@"test1.png" size:CGSizeMake(48 / 2, 26 /2) type:right];//从右到左  第一个按钮
    //[rightItem1 setOffset:-20];//两个item都会移动
    [rightItem1 addTarget:self selector:@selector(search) event:(UIControlEventTouchUpInside)];
    
     CustomBarItem *rightItem2 = [CustomBarItem itemWithImage:@"test.png" size:CGSizeMake(39 / 2, 40 / 2) type:left];//第二个
    //[rightItem2 setOffset:-20];//只移动rightItem2
    [rightItem2 addTarget:self selector:@selector(search2) event:(UIControlEventTouchUpInside)];
    NSArray *barButtonItems = @[rightItem1, rightItem2];
    [self.navigationItem addCustomBarItems:barButtonItems itemType:right];
}

- (void)search
{
    NSLog(@"搜索");
}

- (void)search2
{
    NSLog(@"搜索2");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
