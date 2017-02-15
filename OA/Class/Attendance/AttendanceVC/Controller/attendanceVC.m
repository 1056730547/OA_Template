//
//  attendanceVC.m
//  OA
//
//  Created by zzbf on 16/12/20.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "attendanceVC.h"
#import "PrefixHeader.h"
#import "TimeLineViewControl.h"

@interface attendanceVC ()<MAMapViewDelegate,AMapLocationManagerDelegate,AMapSearchDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@property (nonatomic, strong) AMapLocationManager *locationManager;

@property (nonatomic, strong) AMapSearchAPI *search;

@property (nonatomic, strong)NSTimer *timer;

@end

@implementation attendanceVC

- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationItem.title = @"考勤";
    
    [self loadMap];

    [self loadTimeLine];
    
    [self loadUI];
    
}

-(void)loadMap{
    
    [MAMapServices sharedServices].apiKey = @"3269c81f296e44c227f06fefd8ca17e0";
    
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:_MapVC.bounds];
    [_mapView setZoomLevel:16.1 animated:YES]; //地图的缩放级别的范围是[3-19]
    _mapView.showsUserLocation = YES;//这句就是开启定位
    _mapView.userTrackingMode = MAUserTrackingModeFollow; // 追踪用户位置.
    [_MapVC addSubview:_mapView];
    
    
    [AMapServices sharedServices].apiKey =@"3269c81f296e44c227f06fefd8ca17e0";
    
    //搜索
    _search = [[AMapSearchAPI alloc] init];
    _search.delegate = self;
    
    
    //定位
    _locationManager = [[AMapLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.pausesLocationUpdatesAutomatically = NO;
    
    //    开始连续定位
    [_locationManager startUpdatingLocation];
    
}


-(void)loadTimeLine{
 
    CGFloat height;
    
    if (IS_IPHONE_5) {
        height = 320;
    }else{
        height =_TimeLineVC.frame.size.width ;
    }
    
    
    NSArray *descriptions = @[@"上班打卡时间：2016-12-02 08:22\n\n地点：四川省成都市青羊区草市街街道大福建营巷19号小区四川农资大厦",@"下班打卡时间：2016-12-02 08:22\n\n地点：四川省成都市青羊区草市街街道大福建营巷19号小区四川农资大厦"];
    TimeLineViewControl *timeline = [[TimeLineViewControl alloc] initWithTimeArray:nil
                                                           andTimeDescriptionArray:descriptions
                                                                  andCurrentStatus:((int)descriptions.count )
                                                                          andFrame:CGRectMake(-40, 10, height ,160)];
    
    //    timeline.center = _TimeLineVC.center;
    //    timeline.backgroundColor = [UIColor redColor];
    
    [_TimeLineVC addSubview:timeline];
    
}

-(void)loadUI{
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeHeadle) userInfo:nil repeats:YES];
    
    if (IS_IPHONE_5) {
        
        _MapVCHeight.constant = 150;
        
        // + 20  比列
        _DKimgHeigh.constant  = 25;
        _DKLabHeight.constant = 45;
        
    }else if (IS_IPHONE_6_PLUS){
        
        _MapVCHeight.constant = 250;
        
    }
    
}


#pragma  mark Map Delegate
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    //    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
    
    MAUserLocation * userLocat = self.mapView.userLocation;
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
    regeo.location = [AMapGeoPoint locationWithLatitude:userLocat.coordinate.latitude longitude:userLocat.coordinate.longitude];
    regeo.requireExtension = YES;
    //发起逆地理编码
    [self.search AMapReGoecodeSearch:regeo];
}

/* 逆地理编码回调. */
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if (response.regeocode != nil)
    {
        
        //        CLLocationCoordinate2D coordinate2D = {request.location.latitude,request.location.longitude};
        //        MACoordinateSpan span = {.01,.01};
        //
        //        MACoordinateRegion region = MACoordinateRegionMake(coordinate2D, span);
        //
        //        //设置范围
        //        [_mapView setRegion:region];
        
        NSLog(@"%@",response.regeocode.formattedAddress);
        
        _DWText.text = response.regeocode.formattedAddress;
        
    }
}

- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error);
}






-(void)timeHeadle{
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@" hh:mm:ss "];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    _TimeText.text = dateString;
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [_timer invalidate];
    _timer = nil;
}




@end
