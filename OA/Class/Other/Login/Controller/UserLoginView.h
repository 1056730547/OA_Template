//
//  UserLoginView.h
//  OA
//
//  Created by zzbf on 16/12/12.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "BaseController.h"

@interface UserLoginView : BaseController

@property (weak, nonatomic) IBOutlet UITextField *Account;

@property (weak, nonatomic) IBOutlet UITextField *Password;

@property (weak, nonatomic) IBOutlet UIButton *LogBtn;

- (IBAction)LogAction:(id)sender;

@end
