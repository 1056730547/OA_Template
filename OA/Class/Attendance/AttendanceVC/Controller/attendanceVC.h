//
//  attendanceVC.h
//  OA
//
//  Created by zzbf on 16/12/20.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "BaseController.h"

@interface attendanceVC : BaseController
@property (weak, nonatomic) IBOutlet UIView *MapVC;
@property (weak, nonatomic) IBOutlet UIView *TimeLineVC;
@property (weak, nonatomic) IBOutlet UILabel *DWText;

@property (weak, nonatomic) IBOutlet UILabel *TimeText;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *MapVCHeight;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *DKimgHeigh;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *DKLabHeight;

@end
