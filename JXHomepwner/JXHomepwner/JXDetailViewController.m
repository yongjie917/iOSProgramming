//
//  JXDetailViewController.m
//  JXHomepwner
//
//  Created by 王加祥 on 16/10/1.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXDetailViewController.h"
#import "JXItem.h"
#import "JXImageStore.h"

@interface JXDetailViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *seriaNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation JXDetailViewController
- (IBAction)takePicture:(id)sender {
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    
    // 如果设备支持相机，就使用拍照模式
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // 通过 info 字典获取选中的照片
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    
    // 以 itemKey 为键，将照片存到自定义类中
    [[JXImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    // 将照片放入 UIImageView 对象
    self.imageView.image = image;
    
    // 关闭 UIImagePickerController 对象
    [self dismissViewControllerAnimated:YES completion:nil];
}
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    JXItem * item = self.item;
    
    // 根据 itemKey，获取照片
    UIImage * imageToDisplay = [[JXImageStore sharedStore] imageForKey:item.itemKey];
    
    // 将得到的图片赋值
    self.imageView.image = imageToDisplay;
}

- (void)setItem:(JXItem *)item {
    _item = item;
    self.navigationItem.title = _item.itemName;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
