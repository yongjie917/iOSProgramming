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
#import "JXDetailViewController.h"

@interface JXItemsViewController ()
/** 头部视图 */
@property (nonatomic,weak) UIView * headerView;
/** 编辑按钮 */
@property (nonatomic,strong) UIButton * editButton;

/** 增加按钮 */
@property (nonatomic,strong) UIButton * addButton;

@end

@implementation JXItemsViewController

- (instancetype)init {
    // 调用父类的指定初始化方法
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem * navItem = self.navigationItem;
        navItem.title = @"JXHomepwner";
        
        // 创建新的 UIBarButtonItem 对象
        // 将其目标对象设置为当前对象，将其多做方法设置为指定方法
        UIBarButtonItem * bdi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addClick:)];
        // 为 UINavigationItem 对象的 rightBarButtonItem 属性赋值
        // 指向新创建的 UIBarButtonItem 对象
        navItem.rightBarButtonItem = bdi;
        
        UIBarButtonItem * edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editClick:)];
        navItem.leftBarButtonItem = edit;
        
        for (NSInteger i=0; i<5; i++) {
            [[JXItemStore sharedStore] createItem];
        }
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 向控制器注册
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];

    
    // 加载头视图
//    [self headerView];
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

/**
 *  删除行
 *
 *  @param tableView    对象
 *  @param editingStyle 操作
 *  @param indexPath    操作的行数
 */
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 如果tableView请求的是删除对象
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // 取出需要删除的对象
        NSArray * items = [[JXItemStore sharedStore] allItem];
        JXItem * item = items[indexPath.row];
        
        // 删除对象
        [[JXItemStore sharedStore] removeItem:item];
        
        // 刷新表格
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}
/**
 *  移动行
 *
 *  @param tableView            对象
 *  @param sourceIndexPath      需要移动的行
 *  @param destinationIndexPath 目标行
 */
- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    [[JXItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                       toIndex:destinationIndexPath.row];
}

#pragma mark - UITalbeViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JXDetailViewController * detailController = [[JXDetailViewController alloc] init];
    
    NSArray * items = [[JXItemStore sharedStore] allItem];
    JXItem * selectedItem = items[indexPath.row];
    // 将选中的JXItem 对象赋给 DetailViewController 对象
    detailController.item = selectedItem;
    // 将新创建的控制器压入到导航控制器对象栈中
    [self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark - 懒加载
- (UIView *)headerView{
    if (_headerView == nil) {
        UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
        // 设置头部视图
        self.tableView.tableHeaderView = headerView;
        headerView.backgroundColor = [UIColor cyanColor];
        [headerView addSubview:self.editButton];
        [headerView addSubview:self.addButton];
        _headerView = headerView;
    }
    return _headerView;
}

- (UIButton *)editButton{
    if (_editButton == nil) {
        _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _editButton.frame = CGRectMake(0, 0, self.view.bounds.size.width / 2, 50);
        [_editButton setTitle:@"Edit" forState:UIControlStateNormal];
        _editButton.backgroundColor = [UIColor greenColor];
        [_editButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_editButton addTarget:self action:@selector(editClick:) forControlEvents:UIControlEventTouchDown];
    }
    return _editButton;
}

- (UIButton *)addButton{
    if (_addButton == nil) {
        UIButton * addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addButton.frame = CGRectMake(self.view.bounds.size.width / 2, 0, self.view.bounds.size.width / 2, 50);
        [addButton setTitle:@"Add" forState:UIControlStateNormal];
        addButton.backgroundColor = [UIColor blueColor];
        [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchDown];
        _addButton = addButton;
    }
    return _addButton;
}

#pragma mark - 点击事件
- (void)editClick:(UIBarButtonItem *)sender {
    if (self.isEditing) { // 如果是编辑状态，取消编辑
        
        // 更改文字
//        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        
        // 取消编辑
        [self setEditing:NO animated:YES];
    } else {
        
        // 更改文字
//        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
        // 开始编辑
        [self setEditing:YES animated:YES];
    }
}

/**
 *  添加表格时，必须保证 UITableView 对象当前显示的行数与数据源的提供的行数相同。
 *  所以，在添加之前，必须先创建一个新的 JXItem 对象并加入到 JXItemStore 中
 *
 *  @param sender 按钮
 */
- (void)addClick:(UIButton *)sender {
    
    // 创建新的 JXItem 对象，并加入到 JXItemStore 中
    JXItem * newItem = [[JXItemStore sharedStore] createItem];
    
    // 获取新的对象在 allItem 数组中的索引
    NSInteger lastRow = [[[JXItemStore sharedStore] allItem] indexOfObject:newItem];
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    // 将新航插入 UITableView 对象
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}
@end
