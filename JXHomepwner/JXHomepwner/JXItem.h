//
//  JXItem.h
//  JXHomepwner
//
//  Created by 王加祥 on 16/9/25.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXItem : NSObject
/** 创建日期 */
@property (nonatomic,strong,readonly) NSDate * createDate;
/** 名称 */
@property (nonatomic,strong) NSString * itemName;
/** 编号 */
@property (nonatomic,strong) NSString * serialnumber;
/** 价值 */
@property (nonatomic,assign) NSInteger valueInDollars;
/** JXImageStore中的键 */
@property (nonatomic,strong) NSString * itemKey;

+ (instancetype)randomItem;

/**
 *  JXItem类指定的初始化方法
 *  @return 类对象
 */
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(NSInteger)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;
@end
