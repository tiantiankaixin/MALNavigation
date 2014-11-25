//
//  CustomBarItem.m
//  CustomNavigatinItem
//
//  Created by wangtian on 14-11-22.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import "CustomBarItem.h"
#define Default_Offset -10
#define TitleViewSize CGSizeMake(100, 30)//用NSString设置item时 item的尺寸
@implementation CustomBarItem

- (void)initCustomItemWithType:(ItemType)type andSize:(CGSize)size
{
    self.items = [[NSMutableArray alloc] init];
    self.contentBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.contentBarItem.frame = CGRectMake(0, 0, size.width, size.height);
    if (type != center) {
        
        self.fixBarItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        self.fixBarItem.width = Default_Offset;
        UIBarButtonItem *contentItem = [[UIBarButtonItem alloc] initWithCustomView:self.contentBarItem];
        [self.items addObject:self.fixBarItem];
        [self.items addObject:contentItem];
    }
    else if (type == center){
        
        UIView *containerView = [[UIView alloc] initWithFrame:self.contentBarItem.bounds];
        [containerView addSubview:self.contentBarItem];
        [self.items addObject:containerView];
    }
}

+ (CustomBarItem *)itemWithTitle:(NSString *)title textColor:(UIColor *)color fontSize:(CGFloat )font itemType:(ItemType)type
{
    CustomBarItem *item = [[CustomBarItem alloc] init];
    [item initCustomItemWithType:type andSize:TitleViewSize];
    if (type == right) {
        
        [item.contentBarItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    }
    else if (type == left){
        
        [item.contentBarItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    }
    [item.contentBarItem setTitle:title forState:(UIControlStateNormal)];
    [item.contentBarItem setTitleColor:color forState:(UIControlStateNormal)];
    [item.contentBarItem.titleLabel setFont:[UIFont systemFontOfSize:font]];
    return item;
}

+ (CustomBarItem *)itemWithImage:(NSString *)imageName size:(CGSize)size type:(ItemType)type
{
    CustomBarItem *item = [[CustomBarItem alloc] init];
    [item initCustomItemWithType:type andSize:size];
    [item.contentBarItem setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    return item;
}

- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event
{
    [self.contentBarItem addTarget:target action:selector forControlEvents:event];
}

- (void)setOffset:(CGFloat)offSet
{
    self.fixBarItem.width = -offSet;
}

- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem itemType:(ItemType)type
{
    if (type == center) {
        
        [navigationItem setTitleView:[self.items objectAtIndex:0]];
    }
    else if (type == left){
        
        [navigationItem setLeftBarButtonItems:self.items];
    }
    else if (type == right){
        
        [navigationItem setRightBarButtonItems:self.items];
    }
}

- (void)setTitleViewSize:(CGSize)size
{
    [[self.items objectAtIndex:0] setFrame:CGRectMake(0, 0, size.width, size.height)];
    self.contentBarItem.frame = CGRectMake(0, 0, size.width, size.height);
}

@end
