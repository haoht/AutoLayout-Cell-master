//
//  RootViewController.h
//  autolayout_Cell
//
//  Created by liman on 15-1-15.
//  Copyright (c) 2015年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *models;

@property (strong, nonatomic) UITableView *tableView;
@end
