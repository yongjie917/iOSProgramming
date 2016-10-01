//
//  JXDetailViewController.m
//  JXHomepwner
//
//  Created by 王加祥 on 16/10/1.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXDetailViewController.h"
#import "JXItem.h"

@interface JXDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *seriaNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation JXDetailViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 取消当前的第一响应对象
    [self.view endEditing:YES];
    
    // 将修改保存到 JXItem
    JXItem * item = self.item;
    item.itemName = self.nameField.text;
    item.serialnumber = self.seriaNumberField.text;
    item.valueInDollars = [self.valueField.text integerValue];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    JXItem * item = self.item;
    
    self.nameField.text = item.itemName;
    self.seriaNumberField.text = item.itemName;
    self.valueField.text = [NSString stringWithFormat:@"%ld",item.valueInDollars];
    
    // 创建 NSDdateFoemateter 对象，用于将 NSDate 对象转换成简单的日期字符串
    static NSDateFormatter * dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    // 将转换后得到的日期字符串设置为 dateLabel 的标题
    self.dateLabel.text = [dateFormatter stringFromDate:item.createDate];
}

- (void)setItem:(JXItem *)item {
    _item = item;
    self.navigationItem.title = _item.itemName;
}
@end
