//
//  HZSegmentalSelectionView.h
//  test
//
//  Created by LiuYihua on 2019/4/17.
//  Copyright © 2019 yongdaoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^HZSelectionViewClickBlock)(NSInteger index);
@interface HZSegmentalSelectionView : UIView

@property (nonatomic, strong) NSArray <NSString *>*itemArray;//字符串数组item名称
@property (nonatomic, assign) CGFloat   hzBorderWidth;//边框宽度 默认1
@property (nonatomic, strong) UIColor * hzBorderColor;//边框颜色
@property (nonatomic, strong) UIColor * hzNomalBackgroundColor;//默认背景颜色
@property (nonatomic, strong) UIColor * hzSelectBackgroundColor;//选中背景颜色
@property (nonatomic, strong) UIColor * hzNomalTitleColor;//字体默认颜色
@property (nonatomic, strong) UIColor * hzSelectTitleColor;//字体选中颜色
@property (nonatomic, strong) UIFont  * hzTitleFont;//字体大小
@property (nonatomic, copy  ) HZSelectionViewClickBlock  selectionViewClickBlock;

- (instancetype)initWithFrame:(CGRect)frame itemArray:(nonnull NSArray *)itemArray;
- (void)setTitle:(NSString *)title forItemAtIndex:(NSUInteger)itemIndex;

@end

NS_ASSUME_NONNULL_END
