//
//  ExaminappDetailVC.h
//  OA
//
//  Created by zzbf on 16/12/15.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "BaseController.h"

@interface ExaminappDetailVC : BaseController
<
UITableViewDelegate,
UITableViewDataSource
>

@property (weak, nonatomic) IBOutlet UITableView *MyTable;

@property (nonatomic , copy) NSString *Type;

@end
