//
//  ViewController.m
//  CustomBarItemDemo
//
//  Created by wangtian on 14-11-22.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import "ViewController.h"
#import "MoreItemViewController.h"
#import "UINavigationItem+CustomItem.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.3 green:0.4 blue:0.4 alpha:0.4]];
    [self setUpNavigationItem];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setUpNavigationItem
{
    
    [self.navigationItem setItemWithImage:@"test1.png" size:CGSizeMake(24, 13) itemType:left];
    
    CustomBarItem *centerItem = [self.navigationItem setItemWithTitle:@"中间的中间的中" textColor:[UIColor whiteColor] fontSize:19 itemType:center];
    [centerItem addTarget:self selector:@selector(clickTitleView) event:(UIControlEventTouchUpInside)];
    
    CustomBarItem *rightItem = [self.navigationItem setItemWithTitle:@"右边右边" textColor:[UIColor whiteColor] fontSize:17 itemType:right];
    [rightItem setOffset:10];//设置item偏移量(正值向左偏，负值向右偏)
    
    //[self setUpLeftNavigationItem];//多个item 
}

- (void)clickTitleView
{
    NSLog(@"点击了titleView");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moreItem:(UIButton *)sender
{
    [self.navigationController pushViewController:[[MoreItemViewController alloc] init] animated:YES];
}
@end
