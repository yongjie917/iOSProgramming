//
//  JXDetailViewController.h
//  JXHomepwner
//
//  Created by 王加祥 on 16/10/1.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXItem;

@interface JXDetailViewController : UIViewController

/** 接收参数 */
@property (nonatomic,strong) JXItem * item;

@end
