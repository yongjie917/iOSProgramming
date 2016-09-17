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
    
    // 创建两个 CGRect 结构分别作为 UIScrollView 对象和 JXHypnosisView 对象的 frame
    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    
    // 创建一个 UIScrollView 对象，将其尺寸设置为当前视图窗口大小
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [self.view addSubview:scrollView];
    
//    // 创建一个有着超级大尺寸的 JXHypnosisView 对象并将其加入 UIScrollView 对象
//    JXHypnosisView * hypnosisView = [[JXHypnosisView alloc] initWithFrame:bigRect];
//    [scrollView addSubview:hypnosisView];
    
    // 创建一个大小与屏幕相同的 JXHypnosisView 对象并将其加入 UIScrollView 对象
    JXHypnosisView * hypnosisView = [[JXHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:hypnosisView];
    
    // 创建第二个大小与屏幕相同的 JXHypnosisView 对象并放置在第一个 JXHypnosisView 对象的右侧，使其刚好移出到屏幕外
    screenRect.origin.x += screenRect.size.width;
    JXHypnosisView * anotherView = [[JXHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:anotherView];
    
    // 告诉 UIScrollView 对象 “取景”范围有多大
    scrollView.contentSize = bigRect.size;

    
}

@end
