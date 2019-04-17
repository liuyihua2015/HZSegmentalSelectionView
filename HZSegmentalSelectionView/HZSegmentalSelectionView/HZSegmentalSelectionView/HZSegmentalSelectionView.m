//
//  HZSegmentalSelectionView.m
//  test
//
//  Created by LiuYihua on 2019/4/17.
//  Copyright © 2019 yongdaoyun. All rights reserved.
//

#import "HZSegmentalSelectionView.h"
@interface HZSegmentalSelectionView()
@property (nonatomic, strong) UIView * bgView;

@end
@implementation HZSegmentalSelectionView

- (NSArray *)itemArray {
    
    if (!_itemArray) {
        _itemArray = [NSArray array];
        
    }
    return _itemArray;
}


//赖加载 -- _bgView
-(UIView *)bgView{
    
    if (!_bgView) {
        
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _bgView.layer.cornerRadius = self.frame.size.height * 0.5;
        _bgView.layer.borderWidth  = self.hzBorderWidth;
        _bgView.layer.borderColor = self.hzBorderColor.CGColor;
        _bgView.clipsToBounds = YES;
        
    }
    return _bgView;
}

-(void)setHzBorderColor:(UIColor *)hzBorderColor{
    
    _hzBorderColor = hzBorderColor;
    self.bgView.layer.borderColor = hzBorderColor.CGColor;
    
}
-(void)setHzBorderWidth:(CGFloat)hzBorderWidth{
    
    _hzBorderWidth = hzBorderWidth;
    self.bgView.layer.borderWidth  = hzBorderWidth;
}


- (instancetype)initWithFrame:(CGRect)frame itemArray:(nonnull NSArray *)itemArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.hzSelectTitleColor = [UIColor whiteColor];
        self.hzNomalTitleColor = [UIColor redColor];
        self.hzSelectBackgroundColor = [UIColor redColor];
        self.hzNomalBackgroundColor = [UIColor whiteColor];
        self.hzBorderColor = [UIColor redColor];
        self.hzBorderWidth = 1;
        self.hzTitleFont = [UIFont systemFontOfSize:16];
        self.itemArray = itemArray;
        
        [self addSubview:self.bgView];
        
    }
    return self;
}





-(void)layoutSubviews{
    

    for (int i = 0; i < self.itemArray.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*self.frame.size.width /self.itemArray.count, 0, self.bgView.frame.size.width /self.itemArray.count, self.bgView.frame.size.height);
        btn.tag = i;
        [btn setTitle:self.itemArray[i] forState:UIControlStateNormal];
        
        if (i == 0) {
            [btn setBackgroundColor:self.hzSelectBackgroundColor];
            [btn setTitleColor:self.hzSelectTitleColor forState:UIControlStateNormal];
        }else{
            [btn setBackgroundColor:self.hzNomalBackgroundColor];
            [btn setTitleColor:self.hzNomalTitleColor forState:UIControlStateNormal];
        }
        btn.titleLabel.font = self.hzTitleFont;
        [btn addTarget:self action:@selector(publishBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.bgView addSubview:btn];
    }
    
    
    
}


-(void)publishBtnClick:(UIButton *)btn{
    
    
    for (UIView * view in self.bgView.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton * tempBtn = (UIButton *)view;
            tempBtn.backgroundColor = self.hzNomalBackgroundColor;
            [tempBtn setTitleColor:self.hzNomalTitleColor forState:UIControlStateNormal];
        }
        
    }
    
    btn.backgroundColor = self.hzSelectBackgroundColor;
    [btn setTitleColor:self.hzSelectTitleColor forState:UIControlStateNormal];
    
    if (self.selectionViewClickBlock) {
        self.selectionViewClickBlock(btn.tag);
    }
   
    
}

//修改item名称
- (void)setTitle:(NSString *)title forItemAtIndex:(NSUInteger)itemIndex {
    
    for (UIView * view in self.bgView.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton * tempBtn = (UIButton *)view;
            
            if (itemIndex == tempBtn.tag) {
                [tempBtn setTitle:title forState:UIControlStateNormal];
            }
            
        }
        
    }
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
