//
//  TableViewCell.m
//  ShoppingCar
//
//  Created by LeMo-test on 16/11/11.
//  Copyright © 2016年 Lemo. All rights reserved.
//
# define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(UIImageView *)giftImg
{
    if (!_giftImg) {
        _giftImg = [[UIImageView alloc]init];
        _giftImg.frame = CGRectMake(10, 15, 75, 75);
        _giftImg.layer.cornerRadius = 75/2;
        _giftImg.layer.masksToBounds = YES;
        [self addSubview:_giftImg];
    }
    return _giftImg;
}
-(UILabel *)giftNameLabel
{
    if (!_giftNameLabel) {
        _giftNameLabel = [[UILabel alloc]init];
        _giftNameLabel.frame = CGRectMake(10+75+10, 10+25, 170, 16);
        _giftNameLabel.font = [UIFont systemFontOfSize:16];
        _giftNameLabel.textColor = [UIColor grayColor];
        [self addSubview:_giftNameLabel];
    }
    return _giftNameLabel;
}
-(UILabel *)giftNum
{
    if (!_giftNum) {
        _giftNum = [[UILabel alloc]init];
        _giftNum.frame = CGRectMake(20+75, 10+25+16+5, 170, 14);
        _giftNum.font = [UIFont systemFontOfSize:14];
//        _giftNum.textColor = KClassColor(@"#909090");
        [self addSubview:_giftNum];
    }
    return _giftNum;
}
-(UIButton *)reduceBtn
{
    if (!_reduceBtn) {
        _reduceBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _reduceBtn.frame = CGRectMake(SCREEN_WIDTH-10-30-30-30, 75/2-15/2+5, 35, 30);
        [_reduceBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_reduceBtn addTarget:self action:@selector(reduce:) forControlEvents:(UIControlEventTouchUpInside)];
        _reduceBtn.tag = 11;
        //        [_reduceBtn setTitle:@"-" forState:(UIControlStateNormal)];
        _reduceBtn.layer.cornerRadius = 3.0f;
        _reduceBtn.layer.borderWidth = 0.5f;
        [self addSubview:_reduceBtn];
    }
    return _reduceBtn;
}
-(UIButton *)addBtn
{
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _addBtn.frame = CGRectMake(SCREEN_WIDTH-10-35, 75/2-15/2+5, 35, 30);
        //        [_addBtn setTitle:@"+" forState:(UIControlStateNormal)];
        [_addBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_addBtn addTarget:self action:@selector(addBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _addBtn.tag = 12;
        _addBtn.layer.cornerRadius = 3.0f;
        _addBtn.layer.borderWidth = 0.5;
        [self addSubview:_addBtn];
    }
    return _addBtn;
}

/**
 * 点击减按钮实现数量的减少
 *
 * @param sender 减按钮
 */
-(void)reduce:(UIButton *)sender
{
    [self.delegate btnClick:self andFlag:(int)sender.tag];
    
}
/**
 * 点击加按钮实现数量的增加
 *
 * @param sender 加按钮
 */
-(void)addBtnAction:(UIButton *)sender
{
    //调用代理
    [self.delegate btnClick:self andFlag:(int)sender.tag];
}
-(UITextField *)selectNum
{
    if (!_selectNum) {
        _selectNum = [[UITextField alloc]init];
        _selectNum.frame = CGRectMake(SCREEN_WIDTH-10-30-30, 75/2-15/2+5, 30, 30);
        _selectNum.font = [UIFont systemFontOfSize:14];
        _selectNum.delegate = self;
        _selectNum.textAlignment = NSTextAlignmentCenter;
        _selectNum.keyboardType = UIKeyboardTypeNumberPad;
        _selectNum.backgroundColor = [UIColor whiteColor];
        _selectNum.layer.borderWidth = 0.5f;
        [self addSubview:_selectNum];
    }
    return _selectNum;
}
-(void)addTheValue:(DataModel *)model
{
    self.selectNum.text = [NSString stringWithFormat:@"%ld",model.giftNo];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    [self.delegate giftNumField:self andText:textField.text];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
