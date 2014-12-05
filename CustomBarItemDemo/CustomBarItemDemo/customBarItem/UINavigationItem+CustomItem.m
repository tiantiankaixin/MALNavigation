//
//  UINavigationItem+CustomItem.m
//  CustomBarItemDemo
//
//  Created by wangtian on 14-11-22.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import "UINavigationItem+CustomItem.h"

@implementation UINavigationItem (CustomItem)

- (CustomBarItem *)setItemWithTitle:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)font itemType:(ItemType)type
{
    CustomBarItem *item = [CustomBarItem itemWithTitle:title textColor:color fontSize:font itemType:type];
    [item setItemWithNavigationItem:self itemType:type];
    return item;
}

- (CustomBarItem *)setItemWithImage:(NSString *)imageName size:(CGSize)size itemType:(ItemType)type
{
    CustomBarItem *item = [CustomBarItem itemWithImage:imageName size:size type:type];
    [item setItemWithNavigationItem:self itemType:type];
    return item;
}

- (CustomBarItem *)setItemWithCustomView:(UIView *)customView itemType:(ItemType)type
{
    CustomBarItem *item = [CustomBarItem itemWithCustomView:customView itemType:type];
    [item setItemWithNavigationItem:self itemType:type];
    return item;
}

- (void)addCustomBarItems:(NSArray *)array itemType:(ItemType)type {
    
    NSMutableArray *mutableItems = [[NSMutableArray alloc] init];
    for (CustomBarItem *barItem in array) {
        [mutableItems addObjectsFromArray:barItem.items];
    }
    if (type == center) {
        
        //TODO
    }
    else if (type == left){
        
        
        [self setLeftBarButtonItems:mutableItems];
    }
    else if (type == right){
        
        [self setRightBarButtonItems:mutableItems];
    }
}

@end
