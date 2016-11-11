//
//  TableViewCell.h
//  ShoppingCar
//
//  Created by LeMo-test on 16/11/11.
//  Copyright © 2016年 Lemo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DataModel.h"
@protocol MyCustomCellDelegate
-(void)btnClick:(UITableViewCell *)cell andFlag:(int)flag;
-(void)giftNumField:(UITableViewCell *)cell andText:(NSString *)text;
@end
@interface TableViewCell : UITableViewCell<UITextFieldDelegate>
/**
 *礼物图片
 */
@property (nonatomic,strong)UIImageView *giftImg;
/**
 *礼物名称
 */
@property (nonatomic,strong)UILabel *giftNameLabel;
/**
 *礼物数量
 */
@property (nonatomic,strong)UILabel *giftNum;
/**
 *礼物价值
 */
@property (nonatomic,strong)UILabel *giftPrice;
/**
 *减少礼物数量
 */
@property (nonatomic,strong)UIButton *reduceBtn;
/**
 *增加礼物数量
 */
@property (nonatomic,strong)UIButton *addBtn;
/**
 *选择的礼物数量
 */
@property (nonatomic,strong)UITextField *selectNum;

@property(assign,nonatomic)id<MyCustomCellDelegate>delegate;
//赋值
-(void)addTheValue:(DataModel *)goodsModel;
@end
