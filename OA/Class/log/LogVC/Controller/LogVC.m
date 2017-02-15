//
//  LogVC.m
//  OA
//
//  Created by zzbf on 16/12/13.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "LogVC.h"
#import "PrefixHeader.h"
#import "NewLogVC.h"
#import "LogdetailVC.h"

@interface LogVC ()

@property (strong , nonatomic) NSMutableArray *ImageArr;
@property (strong , nonatomic) NSMutableArray *TitleArr;
@property (strong , nonatomic) NSMutableArray *DetailArr;

@end

@implementation LogVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUI];
    
    [self loadData];
    
    
}


- (void)loadUI
{
    self.navigationItem.title   = @"日志";
    
    UIView *view                = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor        = [UIColor groupTableViewBackgroundColor];
    self.view                   = view;
    
    
    CGFloat height              = [[UIDevice currentDevice].model hasPrefix:@"iPad"] ? 450 : 300;
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, height)];
    img.userInteractionEnabled = YES;
    
//    img.image = [UIImage imageNamed:@"center"];
//    
//    [view addSubview:img];
    
    // 450 for iPad and 300 for iPhone
    FSCalendar *calendar        = [[FSCalendar alloc] initWithFrame:img.bounds];
    calendar.dataSource         = self;
    calendar.delegate           = self;
    calendar.scrollDirection    = FSCalendarScrollDirectionHorizontal;
 
    [view addSubview:calendar];
    
    self.calendar               = calendar;
    
    _calendar.appearance.weekdayTextColor = [UIColor redColor];
    _calendar.appearance.headerTitleColor = [UIColor redColor];
//    _calendar.appearance.headerTitleColor = [UIColor whiteColor];
//     _calendar.appearance.titleDefaultColor = [UIColor whiteColor];
//    _calendar.appearance.eventDefaultColor = [UIColor redColor];
//    _calendar.appearance.eventDefaultColor = FSCalendarStandardEventDotColor;
//    _calendar.appearance.selectionColor = FSCalendarStandardSelectionColor;
//    _calendar.appearance.headerDateFormat = @"MMMM yyyy";
//    _calendar.appearance.todayColor = FSCalendarStandardTodayColor;
//    _calendar.appearance.borderRadius = 1.0;
//    _calendar.appearance.headerMinimumDissolvedAlpha = 0.2;
    
    UIView *addVC               = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(calendar.frame)+2, ScreenWidth, 50)];
    addVC.backgroundColor       = [UIColor whiteColor];
    [view addSubview:addVC];
    
    UIImageView *addImg         = [[UIImageView alloc]initWithFrame:CGRectMake(22, 15, 22, 22)];
    addImg.image                = [UIImage imageNamed:@"add"];
    [addVC addSubview:addImg];
    
    UILabel *New                = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addImg.frame)+24, 15, 100, 21)];
    New.text                    =  @"新建日志";
    [addVC addSubview:New];
    
    UITapGestureRecognizer *Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addAction)];
    [addVC addGestureRecognizer:Tap];
    
    /////////////
    
    // 状态栏(statusbar)
    CGRect rectStatus           = [[UIApplication sharedApplication] statusBarFrame];
//    NSLog(@"status width - %f", rectStatus.size.width); // 宽度
//    NSLog(@"status height - %f", rectStatus.size.height);   // 高度
//    
    // 导航栏（navigationbar）
    CGRect rectNav              = self.navigationController.navigationBar.frame;
//    NSLog(@"nav width - %f", rectNav.size.width); // 宽度
//    NSLog(@"nav height - %f", rectNav.size.height);   // 高度
//    
    
    UITableView *MyTable        = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(addVC.frame)+1, ScreenWidth, ScreenHeight-calendar.frame.size.height-addVC.frame.size.height - rectStatus.size.height - rectNav.size.height) style:UITableViewStylePlain];
    MyTable.delegate            = self;
    MyTable.dataSource          = self;
    MyTable.tableFooterView     = [UIView new];
    
    [view addSubview:MyTable];
    
    
    
    
    
    
}

-(void)loadData{
    
    self.gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSLocale *chinese = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
    
    self.dateFormatter1 = [[NSDateFormatter alloc] init];
    self.dateFormatter1.locale = chinese;
    self.dateFormatter1.dateFormat = @"yyyy/MM/dd";
    
    self.dateFormatter2 = [[NSDateFormatter alloc] init];
    self.dateFormatter2.locale = chinese;
    self.dateFormatter2.dateFormat = @"yyyy-MM-dd";
    
    
    self.lunarCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    self.lunarCalendar.locale = chinese;
    self.lunarChars = @[@"初一",@"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",@"二一",@"二二",@"二三",@"二四",@"二五",@"二六",@"二七",@"二八",@"二九",@"三十"];
    
    
    _datesWithEvent = @[@"2016-12-03",
                        @"2016-12-07",
                        @"2016-12-15",
                        @"2016-12-25"];
    
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss SS"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSLog(@"dateString:%@",dateString);

    
    
    _ImageArr = [NSMutableArray arrayWithObjects:@"ZJ",@"JH", nil];
    _TitleArr = [NSMutableArray arrayWithObjects:@"公司将于2017年2月上市，热烈祝贺",@"公司将于2017年2月上市，热烈祝贺", nil];
    _DetailArr = [NSMutableArray arrayWithObjects:@"总结时间：2016-11-30",@"计划时间：2016-12-25", nil];
    
    
    
}

#pragma  mark  TableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid         = @"cellid";
    
    UITableViewCell *cell           = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (!cell) {
        
        cell                        = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    
    cell.imageView.image            = [UIImage imageNamed:_ImageArr[indexPath.row]];
    cell.textLabel.text             = _TitleArr[indexPath.row];
    cell.detailTextLabel.text       = _DetailArr[indexPath.row];
    
    cell.detailTextLabel.textColor  = [UIColor lightGrayColor];
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LogdetailVC *logdetail = [[LogdetailVC alloc]initWithNibName:@"LogdetailVC" bundle:nil];
    [self.navigationController pushViewController:logdetail animated:YES];
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}





- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - <FSCalendarDelegate>

- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
//    NSLog(@"should select date %@",[self.dateFormatter stringFromDate:date]);
    return YES;
}

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSLog(@"did select date %@",[self.dateFormatter1 stringFromDate:date]);
    if (monthPosition == FSCalendarMonthPositionNext || monthPosition == FSCalendarMonthPositionPrevious) {
        [calendar setCurrentPage:date animated:YES];
    }
}

- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar
{
//    NSLog(@"did change to page %@",[self.dateFormatter stringFromDate:calendar.currentPage]);
}

- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
{
    calendar.frame = (CGRect){calendar.frame.origin,bounds.size};
}

#pragma mark - <FSCalendarDataSource>


- (NSString *)calendar:(FSCalendar *)calendar titleForDate:(NSDate *)date
{
    return [self.gregorianCalendar isDateInToday:date] ? @"今天" : nil;
}

//农历
- (NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date
{
    NSInteger day = [_lunarCalendar component:NSCalendarUnitDay fromDate:date];
    return _lunarChars[day-1];
}


- (NSDate *)minimumDateForCalendar:(FSCalendar *)calendar
{
    return [self.dateFormatter1 dateFromString:@"2016/10/01"];
}

- (NSDate *)maximumDateForCalendar:(FSCalendar *)calendar
{
    return [self.dateFormatter1 dateFromString:@"2029/12/31"];
}

//////////// 事件 点点
- (NSInteger)calendar:(FSCalendar *)calendar numberOfEventsForDate:(NSDate *)date
{
    return [_datesWithEvent containsObject:[self.dateFormatter2 stringFromDate:date]];
}


- (CGPoint)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance titleOffsetForDate:(NSDate *)date
{
    if ([self calendar:calendar subtitleForDate:date]) {
        return CGPointZero;
    }
    if ([_datesWithEvent containsObject:[self.dateFormatter2 stringFromDate:date]]) {
        return CGPointMake(0, -2);
    }
    return CGPointZero;
}

- (CGPoint)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance eventOffsetForDate:(NSDate *)date
{
    if ([self calendar:calendar subtitleForDate:date]) {
        return CGPointZero;
    }
    if ([_datesWithEvent containsObject:[self.dateFormatter2 stringFromDate:date]]) {
        return CGPointMake(0, -10);
    }
    return CGPointZero;
}

- (NSArray<UIColor *> *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance eventSelectionColorsForDate:(nonnull NSDate *)date
{
    if ([self calendar:calendar subtitleForDate:date]) {
        return @[appearance.eventDefaultColor];
    }
    if ([_datesWithEvent containsObject:[self.dateFormatter2 stringFromDate:date]]) {
        return @[[UIColor whiteColor]];
    }
    return nil;
}
//////////// 事件 点点


#pragma  mark 新建事件 Action

-(void)addAction{
    
    NewLogVC *new = [[NewLogVC alloc]initWithNibName:@"NewLogVC" bundle:nil];
    
    [self.navigationController pushViewController:new animated:YES];
    
}







@end
