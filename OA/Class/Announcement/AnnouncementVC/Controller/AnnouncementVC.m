//
//  AnnouncementVC.m
//  OA
//
//  Created by zzbf on 16/12/14.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "AnnouncementVC.h"
#import "WorkorderCell.h"
#import "AnnoundetailsVC.h"

@interface AnnouncementVC ()<UITableViewDelegate, UITableViewDataSource>



@end

@implementation AnnouncementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"公告";
    
    [_MyTable registerNib:[UINib nibWithNibName:@"WorkorderCell" bundle:nil] forCellReuseIdentifier:@"cellid"];
    _MyTable.tableFooterView = [UIView new];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid             = @"cellid";
    
    WorkorderCell   *cell               = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if ( !cell ) {
        
        cell                            = [[[NSBundle mainBundle]loadNibNamed:@"WorkorderCell" owner:nil options:nil]lastObject];
    }
    
    cell.ODetail.text = @"签发人: BOss";
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AnnoundetailsVC *announ = [[AnnoundetailsVC alloc]initWithNibName:@"AnnoundetailsVC" bundle:nil];
    [self.navigationController pushViewController:announ animated:YES];
    
    
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}

@end
