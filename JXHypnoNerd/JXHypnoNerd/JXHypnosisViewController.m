//
//  JXHypnosisViewController.m
//  JXHypnoNerd
//
//  Created by 王加祥 on 16/9/19.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXHypnosisViewController.h"
#import "JXHypnosisView.h"

@interface JXHypnosisViewController ()


@end

@implementation JXHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 设置标签项的标题
        self.tabBarItem.title = @"Hypnotize";
        
        // 从图片文件创建一个 UIImage 对象
        UIImage * i = [UIImage imageNamed:@"Hypno"];
        
        // 将 UIImage 对象赋值给标签项的 iamge 属性
        self.tabBarItem.image = i;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)loadView {
    // 创建一个 JXHypnosisView 对象
    JXHypnosisView * backgroundView = [[JXHypnosisView alloc] init];
    
    // 将 JXHypnosisView 对象赋给视图控制器的view 属性
    self.view = backgroundView;
}


@end
