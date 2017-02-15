//
//  NewLogVC.h
//  OA
//
//  Created by zzbf on 16/12/14.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "BaseController.h"

@interface NewLogVC : BaseController


@property (weak, nonatomic) IBOutlet UILabel *Type;

@property (weak, nonatomic) IBOutlet UIView *NoteView;

@property (weak, nonatomic) IBOutlet UITextField *TimeField;


- (IBAction)TypeAction:(id)sender;

- (IBAction)submitAction:(id)sender;



@end
