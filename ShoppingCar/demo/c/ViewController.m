//
//  ViewController.m
//  ShoppingCar
//
//  Created by LeMo-test on 16/11/11.
//  Copyright © 2016年 Lemo. All rights reserved.
//
# define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#import "ViewController.h"
#import "TableViewCell.h"
#import "DataModel.h"
#import "ToatalPriceBottomView.h"
@interface ViewController ()<MyCustomCellDelegate>
@property(nonatomic,strong)ToatalPriceBottomView *footView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.rootTableView];

    
    self.view.backgroundColor = [UIColor lightGrayColor];
    /**
     示例
     */
    DataModel *model1 = [[DataModel alloc]init];
    model1.univalent = 20;
    model1.giftNo = 30;
    model1.giftNum = 30;
    model1.name = @"小桥流水";
    model1.icon = @"image1";
    
    DataModel *model2 = [[DataModel alloc]init];
    model2.univalent = 18.88;
    model2.giftNo = 20;
    model2.giftNum = 20;
    model2.name = @"在水一方";
    model2.icon = @"image2";
    
    DataModel *model3 = [[DataModel alloc]init];
    model3.univalent = 66.66;
    model3.giftNo = 33;
    model3.giftNum = 33;
    model3.name = @"来来往往";
    model3.icon = @"image3";
    
    self.dataArray = [@[model1,model2,model3] mutableCopy];
    /**
     *  计算总价
     */
    [self totalPrice];
    
}
#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    TableViewCell *cell  =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    [cell.reduceBtn setTitle:@"-" forState:(UIControlStateNormal)];
    [cell.addBtn setTitle:@"+" forState:(UIControlStateNormal)];
    
    DataModel *model = self.dataArray[indexPath.row];
    cell.giftNameLabel.text = model.name;
    cell.giftImg.image = [UIImage imageNamed:model.icon];
    cell.giftNum.text = [NSString stringWithFormat:@"共%ld个   单价%.2f元",model.giftNum,(float)model.univalent];
    [cell addTheValue:model];
    cell.delegate = self;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return self.footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 140+20;
}
/**
 * 实现加减按钮点击代理事件
 *
 * @param cell 当前单元格
 * @param flag 按钮标识，11 为减按钮，12为加按钮
 */
-(void)btnClick:(UITableViewCell *)cell andFlag:(int)flag
{
    __weak ViewController *weakSelf = self;
    NSIndexPath *index = [_rootTableView indexPathForCell:cell];
    DataModel *model = weakSelf.dataArray[index.row];
    
    NSInteger limitNum = model.giftNum;
    NSLog(@"-----%ld",limitNum);
    switch (flag) {
        case 11:
        {
            //做减法
            
            if (model.giftNo > 0)
            {
                model.giftNo --;
            }
        }
            break;
        case 12:
        {
            //做加法
            if (model.giftNo<limitNum) {
                model.giftNo ++;
            }
        }
            break;
        default:
            break;
    }
    //刷新表格
    [weakSelf.rootTableView reloadData];
    //计算总价
    [weakSelf totalPrice];
}
-(void)giftNumField:(UITableViewCell *)cell andText:(NSString *)text
{
    __weak ViewController *weakSelf = self;
    NSIndexPath *index = [_rootTableView indexPathForCell:cell];
    DataModel *model = weakSelf.dataArray[index.row];
    NSInteger limitNum = model.giftNum;
    if ([text integerValue]<0 || [text integerValue]>limitNum) {
        return;
    }
    else
    {
        model.giftNo = [text integerValue];
    }
    //刷新表格
    [weakSelf.rootTableView reloadData];
    //计算总价
    [weakSelf totalPrice];
    
}
-(void)totalPrice
{
    __weak ViewController *weakSelf = self;
    //遍历整个数据源，然后判断如果是选中的商品，就计算价格(单价 * 商品数量)
    for ( int i =0; i<weakSelf.dataArray.count;i++)
    {
        DataModel *model = [weakSelf.dataArray objectAtIndex:i];
        
        allPrice = allPrice + model.giftNo *model.univalent;
    }
//    //给总价文本赋值

    weakSelf.footView.totalPriceLabel.text = [NSString stringWithFormat:@"总价:%.2f元",allPrice];
    
    //每次算完要重置为0，因为每次的都是全部循环算一遍
    allPrice = 0.00;
}


#pragma mark LazyLoad
-(UITableView *)rootTableView
{
    if (!_rootTableView) {
        
        _rootTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        
        _rootTableView.delegate = self;
        
        _rootTableView.dataSource = self;
        
    }
    return _rootTableView;
}
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray new];
        
    }
    return _dataArray;
}
-(ToatalPriceBottomView *)footView
{
    if (!_footView) {
        _footView = [[ToatalPriceBottomView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
//        _footView.delegate = self;
        _footView.totalPriceLabel.text = [NSString stringWithFormat:@"总价:%.2f元",allPrice];
    }
    return _footView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
