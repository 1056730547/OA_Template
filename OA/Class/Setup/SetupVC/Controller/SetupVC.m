//
//  SetupVC.m
//  OA
//
//  Created by zzbf on 16/12/15.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "SetupVC.h"
#import "PrefixHeader.h"

@interface SetupVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong , nonatomic) NSArray *TitleArr;

@property (strong , nonatomic) NSArray *ImageArr;

@end

@implementation SetupVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"我的";

    UIView *vc = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    vc.backgroundColor = [UIColor whiteColor];

    UIButton *ExitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ExitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    ExitBtn.frame = CGRectMake(0, 0, ScreenWidth, 44);
    [ExitBtn setTitle:@"退出当前账号" forState:UIControlStateNormal];
    [ExitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ExitBtn addTarget:self action:@selector(clickExitAction) forControlEvents:UIControlEventTouchUpInside];
    [vc addSubview:ExitBtn];

    
    
    _MyTable.tableFooterView  = vc;
    
    _ImageArr = @[@"ME",@"WM"];
    
    _TitleArr = @[@"个人信息",@"关于我们"];
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _TitleArr.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid             = @"cellid";
    
    UITableViewCell   *cell             = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if ( !cell ) {
        
        cell                            = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    cell.imageView.image                = [UIImage imageNamed:_ImageArr[indexPath.row]];
    cell.textLabel.text                 = _TitleArr[indexPath.row];
    cell.accessoryType                  = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.font                 = [UIFont systemFontOfSize:15];
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            
            PersonalinformationVC *person = [[PersonalinformationVC alloc]initWithNibName:@"PersonalinformationVC" bundle:nil];
            [self.navigationController pushViewController:person animated:YES];
            
        }
            break;
            
        case 1:
        {
            
           AboutusVC *person = [[AboutusVC alloc]initWithNibName:@"AboutusVC" bundle:nil];
           [self.navigationController pushViewController:person animated:YES];
            
        }
            
            break;
            
        default:
            break;
    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 30;
    
}

-(void)clickExitAction{
    
    NSLog(@"Exit Action");
}




@end
