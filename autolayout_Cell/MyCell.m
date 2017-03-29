//
//  MyCell.m
//  autolayout_Cell
//
//  Created by liman on 15-1-15.
//  Copyright (c) 2015年 liman. All rights reserved.
//

#import "MyCell.h"

@interface MyCell ()
{
    BOOL didUpdateConstraints;
}

@end

@implementation MyCell

#pragma mark - public method
// 似乎没必要写
//- (void)updateFonts
//{
//    _titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
//    _contentLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
//}

#pragma mark - life cycle
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.backgroundColor = [UIColor grayColor];
        _titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
        [self.contentView addSubview:_titleLabel];
        
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.backgroundColor = [UIColor darkGrayColor];
        _contentLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        [self.contentView addSubview:_contentLabel];
        
        
        self.contentView.backgroundColor = [UIColor brownColor];
        
        
//        [self updateFonts];// 似乎没必要写
    }
    
    return self;
}

#pragma mark - updateConstraints method
- (void)updateConstraints
{
    if (didUpdateConstraints) {
        [super updateConstraints];
        return;
    }
    
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-50);
        make.bottom.equalTo(self.contentLabel.top).offset(-10);
    }];
    
    [_contentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-50);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    didUpdateConstraints = YES;

    [super updateConstraints];
}

#pragma mark - layout method
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    
    
//    _titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(_titleLabel.frame);
    _contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(_contentLabel.frame);
    
    _titleLabel.text = _model.title;
    _contentLabel.text = _model.content;
    
    [super layoutSubviews];
}

@end
