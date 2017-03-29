//
//  RootViewController.m
//  autolayout_Cell
//
//  Created by liman on 15-1-15.
//  Copyright (c) 2015年 liman. All rights reserved.
//
#define identifier @"MyCell"

#import "RootViewController.h"
#import "MyCell.h"

@interface RootViewController ()

@property (strong, nonatomic) NSMutableDictionary *offscreenCells;
@end

@implementation RootViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupModels];
    
    [self initTableView];
}

#pragma mark - private method
- (void)setupModels
{
    Model *model1 = [[Model alloc] initWithTitle:@"11"
        content:@"ewqweqweqw"];
    Model *model2 = [[Model alloc] initWithTitle:@"22"
        content:@"ewqweqweqwewqweqweqwewqweqweqwewqweeqw"];
    Model *model3 = [[Model alloc] initWithTitle:@"33" content:@"ewqweqweqwewqweqweqwewqweqweqwewqweqweqwewqweqweqwewqweqweqwewqweqweqwewqweqweqwew"];
    
    _models = @[model1,
                model2,
                model3
                ];
    
    
    _offscreenCells = [NSMutableDictionary dictionary];
}

- (void)initTableView
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.allowsSelection = NO;
    _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    [_tableView registerClass:[MyCell class] forCellReuseIdentifier:identifier];
    [self.view addSubview:_tableView];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_models count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

//    [cell updateFonts];// 似乎没必要写
    cell.model = _models[indexPath.row];

    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [_offscreenCells objectForKey:identifier];
    if (!cell) {
        cell = [[MyCell alloc] init];
        [_offscreenCells setObject:cell forKey:identifier];
    }
    
//    [cell updateFonts];// 似乎没必要写
    cell.model = _models[indexPath.row];

    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    
    
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));

    [cell setNeedsLayout];
    [cell layoutIfNeeded];

    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1;
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

@end
