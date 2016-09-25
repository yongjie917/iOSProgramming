//
//  JXItemStore.m
//  JXHomepwner
//
//  Created by 王加祥 on 16/9/25.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXItemStore.h"
#import "JXItem.h"

@interface JXItemStore ()

/** 可变数组，用来操作 JXItem 对象 */
@property (nonatomic,strong) NSMutableArray * privateItems;

@end

@implementation JXItemStore

// 单粒对象
+ (instancetype)sharedStore {
    static JXItemStore * sharedStore = nil;
    
    // 判断是否需要创建一个 sharedStore 对象
    if (!sharedStore) {
        sharedStore = [[self alloc] init];
    }
    return sharedStore;
}
- (NSArray *)allItem {
    return [self.privateItems copy];
}

- (JXItem *)createItem {
    JXItem * item = [JXItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

#pragma mark - 懒加载
- (NSMutableArray *)privateItems{
    if (_privateItems == nil) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return _privateItems;
}
@end
