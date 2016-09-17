//
//  ViewController.m
//  Hypnosister
//
//  Created by 王加祥 on 16/9/17.
//  Copyright © 2016年 王加祥. All rights reserved.
//
#import "ViewController.h"
#import "JXHypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建 CGRect 结构
    CGRect rect = CGRectMake(100, 200, 200, 300);
    
    // 创建视图
    JXHypnosisView * firstView = [[JXHypnosisView alloc] initWithFrame:rect];
    
    
    // 将视图添加到控制器View上
    [self.view addSubview:firstView];
    
}

@end
