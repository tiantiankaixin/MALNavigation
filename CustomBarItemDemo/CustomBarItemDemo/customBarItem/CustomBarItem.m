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
#define Size(view) view.frame.size
@interface CustomBarItem()

@property (nonatomic, strong) UIBarButtonItem *fixBarItem;
@property (nonatomic, strong) UIView *contentBarItem;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UIButton *itemDefaultChildView;

@end

@implementation CustomBarItem


- (NSMutableArray *)items {
    return _items;
}

- (CGSize)size {
    
    return self.contentBarItem.frame.size;
}

- (void)initCustomItemWithType:(ItemType)type andSize:(CGSize)size
{
    self.itemType = type;
    self.items = [[NSMutableArray alloc] init];
    self.contentBarItem = [[UIView alloc] init];
    self.contentBarItem.frame = CGRectMake(0, 0, size.width, size.height);
    if (type != center) {
        
         self.fixBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        self.fixBarItem.width = Default_Offset;
        UIBarButtonItem *contentItem = [[UIBarButtonItem alloc] initWithCustomView:self.contentBarItem];
        [self.items addObject:self.fixBarItem];
        [self.items addObject:contentItem];
    }
    else if (type == center){
        
        [self.items addObject:self.contentBarItem];
    }
}

- (void)setItemWithCustomView:(UIView *)customView
{
    customView.frame = self.contentBarItem.bounds;
    [self.contentBarItem addSubview:customView];
}

+ (CustomBarItem *)itemWithCustomView:(UIView *)customView itemType:(ItemType)type
{
    CustomBarItem *item = [[CustomBarItem alloc] init];
    [item initCustomItemWithType:type andSize:Size(customView)];
    [item setItemWithCustomView:customView];
    return item;
}

+ (CustomBarItem *)itemWithTitle:(NSString *)title textColor:(UIColor *)color fontSize:(CGFloat )font itemType:(ItemType)type
{
    CustomBarItem *item = [[CustomBarItem alloc] init];
    [item initCustomItemWithType:type andSize:TitleViewSize];
    item.itemDefaultChildView = [UIButton buttonWithType:UIButtonTypeCustom];
    [item setItemWithCustomView:item.itemDefaultChildView];
    if (type == right) {
        
        [item.itemDefaultChildView setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    }
    else if (type == left){
        
        [item.itemDefaultChildView setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    }
    [item.itemDefaultChildView setTitle:title forState:(UIControlStateNormal)];
    [item.itemDefaultChildView setTitleColor:color forState:(UIControlStateNormal)];
    [item.itemDefaultChildView.titleLabel setFont:[UIFont systemFontOfSize:font]];
    return item;
}

+ (CustomBarItem *)itemWithImage:(NSString *)imageName size:(CGSize)size type:(ItemType)type
{
    CustomBarItem *item = [[CustomBarItem alloc] init];
    [item initCustomItemWithType:type andSize:size];
    item.itemDefaultChildView = [UIButton buttonWithType:UIButtonTypeCustom];
    [item setItemWithCustomView:item.itemDefaultChildView];
    [item.itemDefaultChildView setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    return item;
}

- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event
{
    [self.itemDefaultChildView addTarget:target action:selector forControlEvents:event];
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
    if (self.itemType == center) {
        
        [[self.items objectAtIndex:0] setFrame:CGRectMake(0, 0, size.width, size.height)];
    }
    else{
    
         self.contentBarItem.frame = CGRectMake(0, 0, size.width, size.height);
    }
}

@end
