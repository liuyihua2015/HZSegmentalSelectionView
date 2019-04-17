//
//  ViewController.m
//  test
//
//  Created by LiuYihua on 2019/4/16.
//  Copyright © 2019 yongdaoyun. All rights reserved.
//

#import "ViewController.h"
#import "HZSegmentalSelectionView.h"


@interface ViewController ()

@property (nonatomic, strong) HZSegmentalSelectionView * segmentalSelectionView;
@end

@implementation ViewController


-(HZSegmentalSelectionView *)segmentalSelectionView{
    if (!_segmentalSelectionView) {
        _segmentalSelectionView = [[HZSegmentalSelectionView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50) itemArray:@[@"班级圈 ",@"我的审核",@"回复悄悄话"]];
        _segmentalSelectionView.backgroundColor = [UIColor lightGrayColor];
        _segmentalSelectionView.selectionViewClickBlock = ^(NSInteger index) {
          
            NSLog(@"%ld",index);
            
        };
        
    }
   return  _segmentalSelectionView;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.segmentalSelectionView];
    
//
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20,330, 50, 50);
    [btn setTitle:@"变化" forState:UIControlStateNormal];
   
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
 
     [self.view addSubview:btn];
}

-(void)btnClick{
    
    [self.segmentalSelectionView setTitle:@"12314" forItemAtIndex:1];
    
    
}


@end
