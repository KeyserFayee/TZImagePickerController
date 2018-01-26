//
//  TZAssetHeaderView.h
//  TZImagePickerController
//
//  Created by keyser_soz on 2018/1/24.
//  Copyright © 2018年 谭真. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TZAssetHeaderViewDelegate<NSObject>
@optional
/// 选中某日期下的全部照片
- (void)didSelectedAllPhoto:(NSIndexPath *)indexpath selectBtn:(UIButton *)sender;

@end

@interface TZAssetHeaderView : UICollectionReusableView

@property (nonatomic, weak) id <TZAssetHeaderViewDelegate> delegate;
/** 当前header在相册中的位置*/
@property (nonatomic, strong) NSIndexPath *curIndexPath;
/** 全部选中按钮*/
@property (nonatomic, strong) UIButton *selectAllBtn;

- (void)loadDate:(NSString *)date selectState:(BOOL)state;

@end
