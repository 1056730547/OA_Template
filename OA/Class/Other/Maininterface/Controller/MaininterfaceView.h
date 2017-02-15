//
//  MaininterfaceView.h
//  OA
//
//  Created by zzbf on 16/12/12.
//  Copyright © 2016年 zzbf. All rights reserved.
//



#import "BaseController.h"

@interface MaininterfaceView : BaseController

//Actio
- (IBAction)attendanceAction:(id)sender;
- (IBAction)noticeAction:(id)sender;
- (IBAction)announcementAction:(id)sender;
- (IBAction)contactAction:(id)sender;
- (IBAction)examinationApprovalAction:(id)sender;
- (IBAction)setupAction:(id)sender;
- (IBAction)LogAction:(id)sender;
- (IBAction)documentAction:(id)sender;

//Weather
@property (weak, nonatomic) IBOutlet UILabel *City;
@property (weak, nonatomic) IBOutlet UILabel *Weather;
@property (weak, nonatomic) IBOutlet UILabel *Temperature;
@property (weak, nonatomic) IBOutlet UIImageView *WeatherBg;

//LayoutConstraint
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *OneVCHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *TopBGHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *SZboomWidth;


@end
