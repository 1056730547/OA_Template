//
//  PersonalinformationVC.m
//  OA
//
//  Created by zzbf on 16/12/15.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "PersonalinformationVC.h"

@interface PersonalinformationVC ()
<
UINavigationControllerDelegate,
UITableViewDelegate,
UITableViewDataSource
>


@property (strong , nonatomic) NSArray *TitleArr;

@property (strong , nonatomic) NSArray *DetailArr;

@end

@implementation PersonalinformationVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    _MyTable.tableFooterView = [UIView new];
    
    _TitleArr  = @[@"部门",@"职位",@"手机",@"邮箱",@"公司电话"];
    _DetailArr = @[@"技术部",@"iOS",@"13258224269",@"1056730547@qq.com",@"028-86678989"];
    

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    //黑色
    //return UIStatusBarStyleDefault;
    //白色
    return UIStatusBarStyleLightContent;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _TitleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid       = @"cellid";
    
    UITableViewCell   *cell       = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if ( !cell ) {
        cell                      = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
    }
    
    cell.textLabel.text           = _TitleArr[indexPath.row];
    cell.detailTextLabel.text     = _DetailArr[indexPath.row];
    cell.textLabel.font           = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.font     = [UIFont systemFontOfSize:14];
    cell.selectionStyle           = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}



// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
    
}


- (IBAction)BackAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
