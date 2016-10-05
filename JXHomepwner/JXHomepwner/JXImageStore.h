//
//  JXImageStore.h
//  JXHomepwner
//
//  Created by 王加祥 on 16/10/5.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXImageStore : NSObject

+ (instancetype)sharedStore;

/**
 *  保存图片
 *
 *  @param image 图片（字典中值）
 *  @param key   图片名称（字典中键）
 */
- (void)setImage:(UIImage *)image forKey:(NSString *)key;

/**
 *  取出图片
 *
 *  @param key 图片名称
 *
 *  @return 取出的图片
 */
- (UIImage *)imageForKey:(NSString *)key;

/**
 *  删除图片
 *
 *  @param key 根据key删除图片
 */
- (void)deleteImageForKey:(NSString *)key;


@end
