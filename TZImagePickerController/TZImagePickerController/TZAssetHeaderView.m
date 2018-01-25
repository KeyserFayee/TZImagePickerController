//
//  TZAssetHeaderView.m
//  TZImagePickerController
//
//  Created by keyser_soz on 2018/1/24.
//  Copyright © 2018年 谭真. All rights reserved.
//

#import "TZAssetHeaderView.h"
@interface TZAssetHeaderView()

/** 全部选中按钮*/
@property (nonatomic, strong) UIButton *selectAllBtn;
@property (nonatomic, strong) UILabel *dateLabel;

@end

@implementation TZAssetHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.dateLabel];
        [self addSubview:self.selectAllBtn];
    }
    return self;
}

- (void)loadDate:(NSString *)date selectState:(BOOL)state
{
    self.dateLabel.text = date;
    self.selectAllBtn.selected = state;
}

#pragma response
- (void)selectAllAction:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(didSelectedAllPhoto:selectBtn:)] && self.delegate != nil) {
        [self.delegate didSelectedAllPhoto:_curIndexPath selectBtn:self.selectAllBtn];
    }
}

#pragma init
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 200, 21)];
        _dateLabel.textColor = [UIColor blackColor];
        _dateLabel.font = [UIFont systemFontOfSize:15];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _dateLabel;
}

- (UIButton *)selectAllBtn
{
    if (!_selectAllBtn) {
        _selectAllBtn = [[UIButton alloc] initWithFrame:CGRectMake(300, 20, 100, 21)];
        [_selectAllBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_selectAllBtn setTitle:@"取消全选" forState:UIControlStateSelected];
        [_selectAllBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_selectAllBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        [_selectAllBtn addTarget:self action:@selector(selectAllAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectAllBtn;
}


@end
