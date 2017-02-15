//
//  TypeVC.m
//  OA
//
//  Created by zzbf on 16/12/14.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "TypeVC.h"
#import "PrefixHeader.h"

@interface TypeVC ()


@property (strong , nonatomic)NSArray *ImageArr;
@property (strong , nonatomic)NSArray *TitleArr;
@property (strong , nonatomic)NSIndexPath *lastpath;

@end

@implementation TypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self loadUI];
    
    [self loadData];
    
}

-(void)loadUI{
    
    self.navigationItem.title = @"选择类型";
    _MyTable.tableFooterView = [UIView new];
}

-(void)loadData{
    
    _ImageArr = [NSArray arrayWithObjects:@"ZJ",@"JH", nil];
    _TitleArr = [NSArray arrayWithObjects:@"总结",@"计划", nil];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _TitleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *Cellid = @"cellid";
    
    UITableViewCell *  cell   = [tableView dequeueReusableCellWithIdentifier:Cellid];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Cellid];
    }
    
    cell.textLabel.text     = _TitleArr[indexPath.row];
    cell.imageView.image    = [UIImage imageNamed:_ImageArr[indexPath.row]];
    
    NSUInteger row = [indexPath row];
    NSUInteger oldRow = [_lastpath row];
    
    //如何点击当前的cell 最右边就会出现一个对号 ，在点击其他的cell 对号显示当前，上一个小时
    cell.accessoryType =  (row==oldRow &&_lastpath != nil)?UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone;
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger newRow = [indexPath row];
    NSInteger oldRow = (_lastpath != nil) ? [_lastpath row] : -1;
    
    if (newRow != oldRow) {
        
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:
                                    indexPath];
        
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:
                                    _lastpath];
        
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        _lastpath = indexPath;
    }
    
    // 取e消选择状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_TypeBlock) {
        
        _TypeBlock(_TitleArr[indexPath.row]);
    }
    
    [self performSelector:@selector(dismiss) withObject:self afterDelay:1.0f];
    
}

-(void)dismiss{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}



@end
