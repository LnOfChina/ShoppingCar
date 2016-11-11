//
//  ToatalPriceBottomView.m
//  PingPing
//
//  Created by LeMo-test on 16/9/27.
//  Copyright © 2016年 李鹏博. All rights reserved.
//
# define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#import "ToatalPriceBottomView.h"

@implementation ToatalPriceBottomView
-(id)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        //        self.alpha=0;
        //        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        [self upteSubViews];
        
    }
    return self;
}
-(void)upteSubViews
{
    self.totalPriceLabel.frame = CGRectMake(0, 15.5, SCREEN_WIDTH, 40);


}
-(UILabel *)totalPriceLabel
{
    if (!_totalPriceLabel) {
        _totalPriceLabel = [[UILabel alloc]init];
        _totalPriceLabel.font = [UIFont systemFontOfSize:16];
        _totalPriceLabel.backgroundColor = [UIColor whiteColor];
        _totalPriceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_totalPriceLabel];
    }
    return _totalPriceLabel;
}

@end
