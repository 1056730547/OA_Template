//
//  LogVC.h
//  OA
//
//  Created by zzbf on 16/12/13.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "BaseController.h"
#import "FSCalendar.h"


@interface LogVC : BaseController
<
FSCalendarDataSource,
FSCalendarDelegate,
UITableViewDelegate,
UITableViewDataSource
>

@property (weak, nonatomic) FSCalendar *calendar;

@property (strong, nonatomic) NSDateFormatter *dateFormatter1;

@property (strong, nonatomic) NSDateFormatter *dateFormatter2;

@property (strong, nonatomic) NSDictionary<NSString *, UIImage *> *images;

@property (strong, nonatomic) NSArray *datesWithEvent;

@property (strong, nonatomic) NSCalendar *gregorianCalendar;

//农历
@property (strong, nonatomic) NSCalendar *lunarCalendar;

@property (strong, nonatomic) NSArray *lunarChars;


@end
