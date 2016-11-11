//
//  DataModel.h
//  ShoppingCar
//
//  Created by LeMo-test on 16/11/11.
//  Copyright © 2016年 Lemo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
/**
 *单价
 */
@property (nonatomic, assign) float univalent;
/**
 * 数量
 */
@property (nonatomic, assign) NSInteger giftNo;
/**
 * 数量1
 */
@property (nonatomic, assign) NSInteger giftNum;
/**
 *  商品图片
 */
@property (nonatomic, copy) NSString * icon;
/**
 *  商品名字
 */
@property (nonatomic, copy) NSString *name;

@end
