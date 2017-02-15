//
//  MaininterfaceView.m
//  OA
//
//  Created by zzbf on 16/12/12.
//  Copyright © 2016年 zzbf. All rights reserved.
//

//iPhone4做原型时，可以用320*480,
//iPhone5做原型时，可以用320*568,    96
//iPhone6做原型时，可以用375*667,    114.333
//iPhone6 Plus原型，可以用414x736,   127.33


#import "MaininterfaceView.h"
#import "PrefixHeader.h"


@interface MaininterfaceView ()<AMapSearchDelegate>

@property (nonatomic, strong) AMapSearchAPI *search;

@end

@implementation MaininterfaceView

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self LayoutConstraint];
    
    [self loadWeather];
    
    [self loadUI];
}


-(void)LayoutConstraint{
    
    if (IS_IPHONE_6_PLUS) {
        
        _OneVCHeight.constant = 225;
        
    }else if (IS_IPHONE_5){
        
        _TopBGHeight.constant = 100;
        
        _OneVCHeight.constant = 160;
        
        _SZboomWidth.constant = 68;
    }
}

-(void)loadUI{
    
    _City.layer.shadowColor             = [UIColor blackColor].CGColor;
    _City.layer.shadowOffset            = CGSizeMake(0,1);
    _City.layer.shadowOpacity           = 0.8;
    _City.layer.shadowRadius            = 1.0;
    _City.clipsToBounds                 = NO;
    
    _Temperature.layer.shadowColor      = [UIColor blackColor].CGColor;
    _Temperature.layer.shadowOffset     = CGSizeMake(0,1);
    _Temperature.layer.shadowOpacity    = 0.8;
    _Temperature.layer.shadowRadius     = 1.0;
    _Temperature.clipsToBounds          = NO;
    
    _Weather.layer.shadowColor          = [UIColor blackColor].CGColor;
    _Weather.layer.shadowOffset         = CGSizeMake(0,1);
    _Weather.layer.shadowOpacity        = 0.8;
    _Weather.layer.shadowRadius         = 1.0;
    _Weather.clipsToBounds              = NO;
    
}


-(void)loadWeather{
    
    [AMapServices sharedServices].apiKey    = @"3269c81f296e44c227f06fefd8ca17e0";
    
    //搜索
    _search                                 = [[AMapSearchAPI alloc] init];
    _search.delegate                        = self;
    
    //天气
    AMapWeatherSearchRequest *request       = [[AMapWeatherSearchRequest alloc] init];
    request.city                            = @"510100"; // 成都 天气代码
    request.type                            = AMapWeatherTypeLive; //AMapWeatherTypeLive为实时天气；AMapWeatherTypeForecase为预报天气
    
    [self.search AMapWeatherSearch:request];

}

#pragma mark Weather Delegate
- (void)onWeatherSearchDone:(AMapWeatherSearchRequest *)request response:(AMapWeatherSearchResponse *)response{

    AMapLocalWeatherLive *dic   = response.lives[0];
    _City.text                  = dic.city;
    _Weather.text               = dic.weather;
    _Temperature.text           = [NSString stringWithFormat:@"%@℃",dic.temperature];
    
    NSString *str               = dic.weather;
    
    if       ([str rangeOfString:@"晴"].location != NSNotFound){
        _WeatherBg.image = [UIImage imageNamed:@"晴"];
    }else if ([str rangeOfString:@"云"].location != NSNotFound){
        _WeatherBg.image = [UIImage imageNamed:@"云"];
    }else if ([str rangeOfString:@"阴"].location != NSNotFound){
        _WeatherBg.image = [UIImage imageNamed:@"阴"];
    }else if ([str rangeOfString:@"雨"].location != NSNotFound){
        _WeatherBg.image = [UIImage imageNamed:@"雨"];
    }else if ([str rangeOfString:@"雪"].location != NSNotFound){
        _WeatherBg.image = [UIImage imageNamed:@"雪"];
    }else if ([str rangeOfString:@"霾"].location != NSNotFound){
        _WeatherBg.image = [UIImage imageNamed:@"霾"];
    }else{  //通用图片
  
    }
}

- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error);
}

#pragma mark Action Btn Pop
- (IBAction)noticeAction:(id)sender {
    WorknoticeVC *work = [[WorknoticeVC alloc]initWithNibName:@"WorknoticeVC" bundle:nil];
    [self.navigationController pushViewController:work animated:YES];
}

- (IBAction)announcementAction:(id)sender {
    AnnouncementVC *ann = [[AnnouncementVC alloc]initWithNibName:@"AnnouncementVC" bundle:nil];
    [self.navigationController pushViewController:ann animated:YES];
}

- (IBAction)contactAction:(id)sender {
    ContactsVC *cont = [[ContactsVC alloc]initWithNibName:@"ContactsVC" bundle:nil];
    [self.navigationController pushViewController:cont animated:YES];
}

- (IBAction)attendanceAction:(id)sender {
    attendanceVC *announ = [[attendanceVC alloc]initWithNibName:@"attendanceVC" bundle:nil];
    [self.navigationController pushViewController:announ animated:YES];
}

- (IBAction)examinationApprovalAction:(id)sender {
    ExaminationapprovalVC *exp = [[ExaminationapprovalVC alloc]initWithNibName:@"ExaminationapprovalVC" bundle:nil];
    [self.navigationController pushViewController:exp animated:YES];
}

- (IBAction)setupAction:(id)sender {
    SetupVC *set = [[SetupVC alloc]initWithNibName:@"SetupVC" bundle:nil];
    [self.navigationController pushViewController:set animated:YES];

}

- (IBAction)LogAction:(id)sender {
    LogVC *log = [[LogVC alloc]initWithNibName:@"LogVC" bundle:nil];
    [self.navigationController pushViewController:log animated:YES];
}

- (IBAction)documentAction:(id)sender {
    FileVC *file = [[FileVC alloc]initWithNibName:@"FileVC" bundle:nil];
    [self.navigationController pushViewController:file animated:YES];
}





@end









