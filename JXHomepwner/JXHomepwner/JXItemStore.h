//
//  JXItemStore.h
//  JXHomepwner
//
//  Created by 王加祥 on 16/9/25.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JXItem;
@interface JXItemStore : NSObject

/** 存放 JXItem 对象数组 */
@property (nonatomic,readonly) NSArray * allItem;

// 注意，这是一个类方法，前缀是+
+ (instancetype)sharedStore;

- (JXItem *)createItem;

/**
 *  删除对象
 *
 *  @param item 需要删除的对象
 */
- (void)removeItem:(JXItem *)item;

/**
 *  移动对象
 *
 *  @param fromIndex 移动对象的起始位置
 *  @param toIndex   移动后的位置
 */
- (void)moveItemAtIndex:(NSInteger)fromIndex
                toIndex:(NSInteger)toIndex;

@end
