//
//  TypeVC.h
//  OA
//
//  Created by zzbf on 16/12/14.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "BaseController.h"

@interface TypeVC : BaseController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic ,copy)void(^TypeBlock)(NSString *);

@property (weak, nonatomic) IBOutlet UITableView *MyTable;

@end
