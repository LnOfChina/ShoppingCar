//
//  ViewController.h
//  ShoppingCar
//
//  Created by LeMo-test on 16/11/11.
//  Copyright © 2016年 Lemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat allPrice;

}
/**
 *
 */
@property (nonatomic, strong) UITableView    * rootTableView;
/**
 *  数据
 */
@property (nonatomic, strong) NSMutableArray * dataArray;

@end

