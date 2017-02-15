//
//  NewLogVC.m
//  OA
//
//  Created by zzbf on 16/12/14.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "NewLogVC.h"
#import "TypeVC.h"
#import "PrefixHeader.h"

@interface NewLogVC ()<UUDatePickerDelegate>

@property (nonatomic , copy) NSString *year;
@property (nonatomic , copy) NSString *month;
@property (nonatomic , copy) NSString *day;
@property (nonatomic , copy) NSString *hour;
@property (nonatomic , copy) NSString *minute;



@end

@implementation NewLogVC




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"新建";
    
    [self loadUI];
    
}


-(void)loadUI{
    
    YYTextView *NoteText                = [YYTextView new];
    NoteText.frame                      = _NoteView.bounds;
    NoteText.font                       = [UIFont systemFontOfSize:14];
    NoteText.textColor                  = [UIColor blackColor];
    NoteText.placeholderText            = @"备注：";
    NoteText.placeholderTextColor       = [UIColor lightGrayColor];
    [_NoteView addSubview:NoteText];
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    UUDatePicker *datePicker= [[UUDatePicker alloc]initWithframe:CGRectMake(0, ScreenHeight - 216, ScreenWidth, 216)
                                                        Delegate:self
                                                     PickerStyle:UUDateStyle_YearMonthDayHourMinute];
    datePicker.ScrollToDate = currentDate;
//    datePicker.maxLimitDate = currentDate;
    datePicker.minLimitDate = [currentDate dateByAddingTimeInterval:-111111111];

    _TimeField.inputView    = datePicker;

}


- (IBAction)TypeAction:(id)sender {
    
    TypeVC *type = [[TypeVC alloc]initWithNibName:@"TypeVC" bundle:nil];
    [type setTypeBlock:^(NSString *TypeName) {
        
        _Type.text = TypeName;
        
    }];
    
    UINavigationController *Nav = [[UINavigationController alloc]initWithRootViewController:type];
    [self presentViewController:Nav animated:YES completion:nil];
}

- (IBAction)submitAction:(id)sender {
    
    NSLog(@"Action：%@",_TimeField.text);
    
    [self registerNotificationAddyear:_year month:_month day:_day hour:_hour minute:_minute];
}




#pragma mark - UUDatePicker's delegate
- (void)uuDatePicker:(UUDatePicker *)datePicker
                year:(NSString *)year
               month:(NSString *)month
                 day:(NSString *)day
                hour:(NSString *)hour
              minute:(NSString *)minute
             weekDay:(NSString *)weekDay
{
    _TimeField.text = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",year,month,day,hour,minute];
    
    _year = year;
    _month = month;
    _day = day;
    _hour = hour;
    _minute = minute;
    
}





//使用 UNNotification 本地通知
-(void)registerNotificationAddyear:(NSString *)year
                             month:(NSString *)month
                               day:(NSString *)day
                              hour:(NSString *)hour
                            minute:(NSString *)minute{
    
    // 使用 UNUserNotificationCenter 来管理通知
    UNUserNotificationCenter* center        = [UNUserNotificationCenter currentNotificationCenter];
    
    //需创建一个包含待通知内容的 UNMutableNotificationContent 对象，注意不是 UNNotificationContent ,此对象为不可变对象。
    UNMutableNotificationContent* content   = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:@"本地推送!"            arguments:nil];
    content.body  = [NSString localizedUserNotificationStringForKey:@"这是日志时间的推送哦" arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    content.badge = @666;
    content.userInfo = @{@"Name":@"lican",
                         @"Type":@"Log",
                         @"Tag":@1};
    
    
    ///////////////////////////////////////////// 一定时间之后  秒/////////////////////////////////////////////
    
    // 在 alertTime 后推送本地推送
    //        UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
    //                                                      triggerWithTimeInterval:alerTime repeats:NO];
    
    //////////////////////////////////////////// 定期推送  ////////////////////////////////////////////////////////
    
    NSDateComponents *components    = [[NSDateComponents alloc] init];
    components.year                 = [year integerValue];
    components.month                = [month integerValue];
    components.day                  = [day integerValue];
    components.hour                 = [hour integerValue];
    components.minute               = [minute integerValue];
    
    //开启本地推送
    UNCalendarNotificationTrigger* trigger  = [UNCalendarNotificationTrigger
                                              triggerWithDateMatchingComponents:components repeats:NO];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    UNNotificationRequest* request          = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                                                                          content:content trigger:trigger];
    
    //添加推送成功后的处理！
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
    }];
    
}






@end
