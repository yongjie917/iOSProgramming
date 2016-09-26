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


/**
 *  还可以调用 [self.privateItems removeObject:item]
 *  [self.privateItems removeObjectIdenticalTo:item] 与上面的方法的区别就是：上面的方法会枚举数组，向每一个数组发送 isEqual: 消息。
 *  isEqual: 的作用是判断当前对象和传入对象所包含的数据是否相等。可能会复写 这个方法。
 *  removeObjectIdenticalTo: 方法不会比较对象所包含的数据，只会比较指向对象的指针
 *
 *  @param item 需要删除的对象
 */
- (void)removeItem:(JXItem *)item {
    
    [self.privateItems removeObjectIdenticalTo:item];
    
}


- (void)moveItemAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    
    // 如果起始位置和最终位置相同，则不懂
    if (fromIndex == toIndex) return;
    
    // 需要移动的对象的指针
    JXItem * item = self.privateItems[fromIndex];
    
    // 将 item 从 allItem 数组中移除
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    // 根据新的索引位置，将item 插入到allItem 数组中
    [self.privateItems insertObject:item atIndex:toIndex];
}

#pragma mark - 懒加载
- (NSMutableArray *)privateItems{
    if (_privateItems == nil) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return _privateItems;
}
@end
