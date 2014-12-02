//
//  CustomBarItem.h
//  CustomNavigatinItem
//
//  Created by wangtian on 14-11-22.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum{

    left,
    center,
    right

}ItemType;

@interface CustomBarItem : NSObject

@property (nonatomic, assign) CGSize size;


+ (CustomBarItem *)itemWithTitle:(NSString *)title textColor:(UIColor *)color fontSize:(CGFloat)font itemType:(ItemType)type;
+ (CustomBarItem *)itemWithImage:(NSString *)imageName size:(CGSize)size type:(ItemType)type;
- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem itemType:(ItemType)type;
- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;
- (void)setOffset:(CGFloat)offSet;//设置item偏移量(在左侧数值越大越靠左，在右侧数值越大越靠右)
- (void)setTitleViewSize:(CGSize)size;
- (NSMutableArray *)items;

@end
