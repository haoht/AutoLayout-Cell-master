//
//  Model.m
//  autolayout_Cell
//
//  Created by liman on 15-1-15.
//  Copyright (c) 2015年 liman. All rights reserved.
//

#import "Model.h"

@implementation Model

#pragma mark - public method
- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content
{
    self = [super init];
    if (self) {
        
        _title = title;
        _content = content;
    }
    return self;
}
@end
