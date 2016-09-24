//
//  JXHypnosisViewController.m
//  JXHypnoNerd
//
//  Created by 王加祥 on 16/9/19.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXHypnosisViewController.h"
#import "JXHypnosisView.h"

@interface JXHypnosisViewController ()<UITextFieldDelegate>


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
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField * textField = [[UITextField alloc] init];
    textField.frame = textFieldRect;
    
    // 设置 UITextField 对象的边框样式，便于查看它在屏幕上的位置
    textField.borderStyle = UITextBorderStyleRoundedRect;
    // 修改占位符
    textField.placeholder = @"Hypontize me";
    // 修改键盘类型
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    // 将 JXHypnosisView 对象赋给视图控制器的view 属性
    self.view = backgroundView;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message {
    for (NSInteger i = 0; i < 20; i++) {
        UILabel * messageLabel = [[UILabel alloc] init];
        
        // 设置 UIlabel 对象的文字和颜色
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        //根据要显示的文字调整 UILabel 对象的大小
        [messageLabel sizeToFit];
        
        // 获取随机 x 坐标
        // 使 UILabe 对象的宽度不超出控制器的 view 宽度
        NSInteger width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        NSInteger x = arc4random() % width;
        
        // 获取随机 y 坐标
        // 使 UILabel 对象的高度不超出控制器的 view 宽度
        NSInteger height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        NSInteger y = arc4random() % height;
        
        // 设置 UILabel 对象的 frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // 将 UILabel 对象添加到控制器的 view 中
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect * motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}


@end
