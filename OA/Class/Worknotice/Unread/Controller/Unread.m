//
//  Unread.m
//  OA
//
//  Created by zzbf on 16/12/14.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "Unread.h"
#import "WorkorderCell.h"

@interface Unread ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation Unread

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
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
    
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}


@end
