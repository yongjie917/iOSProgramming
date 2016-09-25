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
@end
