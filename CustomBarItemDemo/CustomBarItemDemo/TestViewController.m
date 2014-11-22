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
    [self.navigationItem setItemWithImage:@"test1.png" size:CGSizeMake(48/2, 26/2) itemType:left];
    [self.navigationItem setItemWithImage:@"title.png" size:CGSizeMake(141 * 0.5, 37 * 0.5) itemType:center];
    [self.navigationItem setItemWithTitle:@"自定义item" textColor:[UIColor redColor] fontSize:16 itemType:center];
    CustomBarItem *rightItem = [self.navigationItem setItemWithImage:@"test.png" size:CGSizeMake(39/2, 40/2) itemType:right];
    [rightItem addTarget:self selector:@selector(search) event:(UIControlEventTouchUpInside)];
    //[rightItem setOffset:15];//设置item偏移量
}

- (void)search
{
    NSLog(@"搜索");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
