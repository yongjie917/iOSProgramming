//
//  JXReminderViewController.m
//  JXHypnoNerd
//
//  Created by 王加祥 on 16/9/19.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXReminderViewController.h"

@interface JXReminderViewController ()

@property (nonatomic,weak) IBOutlet UIDatePicker * datePicker;

@end

@implementation JXReminderViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 设置标签项的标题
        self.tabBarItem.title = @"Reminder";
        
        // 从图片文件创建一个 UIImage 对象
        UIImage * i = [UIImage imageNamed:@"Time"];
        
        // 将 UIImage 对象赋值给标签项的 iamge 属性
        self.tabBarItem.image = i;
    }
    return self;
}
- (IBAction)addReminder:(id)sender {
    NSDate * date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@",date);
    UILocalNotification * note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

@end
