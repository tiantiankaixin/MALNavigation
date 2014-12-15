//
//  MoreItemViewController.m
//  CustomBarItemDemo
//
//  Created by wangtian on 14-12-15.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import "MoreItemViewController.h"
#import "UINavigationItem+CustomItem.h"
@interface MoreItemViewController ()

@end

@implementation MoreItemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpNavigationItem];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpNavigationItem
{
    //用xib设置比较简单
    [self.navigationItem setItemWithCustomView:self.moreItem itemType:right];
    
    //用代码设置...
    //[self setUpRightNavigationItem];
}

//#pragma mark - 如果要设置多个item，建议采用自定义view。便于控制view之间间距...
//- (void)setUpRightNavigationItem
//{
//    UIView *rightCustomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
//    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
//    [button1 setTitle:@"右一" forState:(UIControlStateNormal)];
//    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 50, 44)];
//    [button2 setTitle:@"右二" forState:(UIControlStateNormal)];
//    [button1 addTarget:self action:@selector(itemClick:) forControlEvents:(UIControlEventTouchUpInside)];
//    [button2 addTarget:self action:@selector(itemClick:) forControlEvents:(UIControlEventTouchUpInside)];
//    [rightCustomView addSubview:button1];
//    [rightCustomView addSubview:button2];
//    CustomBarItem *rightItem = [self.navigationItem setItemWithCustomView:rightCustomView itemType:right];
//    [rightItem setOffset:10];//设置item偏移量(正值向左偏，负值向右偏)
//}

- (void)itemClick:(UIButton *)sender
{
    NSLog(@"%@",[sender titleForState:(UIControlStateNormal)]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
