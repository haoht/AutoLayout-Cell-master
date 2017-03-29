//
//  Model.h
//  autolayout_Cell
//
//  Created by liman on 15-1-15.
//  Copyright (c) 2015年 liman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *content;

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content;
@end
