//
//  JXHypnosisView.m
//  Hypnosister
//
//  Created by 王加祥 on 16/9/17.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXHypnosisView.h"

@interface JXHypnosisView ()

/** 颜色 */
@property (nonatomic,strong) UIColor * circleColor;

@end

@implementation JXHypnosisView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设置 JXHypnosisView 对象的背景颜色为透明
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGRect bounds = self.bounds;
    
    // 根据bounds计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // 是最外层圆形成为视图的外接圆
    float maxRadius = hypotf(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        // 用来设置绘制起始位置
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // 设置线条宽度为 10 点
    path.lineWidth = 10;
    
    // 设置绘制颜色为灰色
    [[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];
    // 绘制路径
    [path stroke];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 取三个 0~1 之间的数字
    float red = (arc4random() % 100) /100.0;
    float green = (arc4random() % 100) /100.0;
    float blue = (arc4random() % 100) /100.0;
    
    UIColor * randomColor = [UIColor colorWithRed:red
                                            green:green
                                             blue:blue
                                            alpha:1.0];
    
    self.circleColor = randomColor;
}

// 为属性实现自定义的存方法
- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}
@end

