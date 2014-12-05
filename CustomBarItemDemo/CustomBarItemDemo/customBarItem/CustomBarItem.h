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
@property (nonatomic, assign) ItemType itemType;

+ (CustomBarItem *)itemWithTitle:(NSString *)title textColor:(UIColor *)color fontSize:(CGFloat)font itemType:(ItemType)type;
+ (CustomBarItem *)itemWithImage:(NSString *)imageName size:(CGSize)size type:(ItemType)type;
+ (CustomBarItem *)itemWithCustomView:(UIView *)customView itemType:(ItemType)type;
- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem itemType:(ItemType)type;
- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;
/**
 *设置item的偏移量
 *@param offSet  当设置leftItem时数值为正则item向左移动，为负则向右移动。当设置rightItem的时候数值为正则向右移动，为负则向左移动。当有多个item的时候，设置边缘的item的时候是整体移动，设置靠里的item的时候只移动里面的item。
 */
- (void)setOffset:(CGFloat)offSet;//设置item偏移量(在左侧数值越大越靠左，在右侧数值越大越靠右)
/**
 *函数说明  当使用文字设置item时，如果不够显示，可以使用这个方法调整大小
 *@param 参数说明 
 */
- (void)setTitleViewSize:(CGSize)size;
- (NSMutableArray *)items;

@end
