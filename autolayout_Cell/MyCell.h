//
//  MyCell.h
//  autolayout_Cell
//
//  Created by liman on 15-1-15.
//  Copyright (c) 2015年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface MyCell : UITableViewCell

@property (strong, nonatomic) Model *model;

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *contentLabel;

//- (void)updateFonts;// 似乎没必要写

@end
