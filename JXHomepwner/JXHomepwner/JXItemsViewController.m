//
//  JXItemsViewController.m
//  JXHomepwner
//
//  Created by 王加祥 on 16/9/25.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXItemsViewController.h"
#import "JXItem.h"
#import "JXItemStore.h"
@interface JXItemsViewController ()

@end

@implementation JXItemsViewController

- (instancetype)init {
    // 调用父类的指定初始化方法
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (NSInteger i=0; i<15; i++) {
            [[JXItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 向控制器注册
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];

}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[JXItemStore sharedStore] allItem] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建 UITableViewCell 对象，风格使用默认风格
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                             forIndexPath:indexPath];
    // 获取 allItem 的第 n 个 JXItem 对象
    // 然后将该 JXItem 对象的描述信息赋值给 UITableViewCell 对象的 textLabel
    // 这里的 n 是该 UITableViewCell 对象所对应的表格索引
    NSArray * items = [[JXItemStore sharedStore] allItem];
    JXItem * item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    return cell;
}
@end
