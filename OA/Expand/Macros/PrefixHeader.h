//
//  PrefixHeader.h
//  OA
//
//  Created by zzbf on 16/12/12.
//  Copyright © 2016年 zzbf. All rights reserved.
//


//类
#import "attendanceVC.h"
#import "LogVC.h"
#import "WorknoticeVC.h"
#import "AnnouncementVC.h"
#import "FileVC.h"
#import "ExaminationapprovalVC.h"
#import "SetupVC.h"
#import "PersonalinformationVC.h"
#import "AboutusVC.h"
#import "NewLogVC.h"
#import "ContactsVC.h"


#import <UserNotifications/UserNotifications.h>

//分类
#import "UIColor+hexColor.h"

//第三方框架
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "MBProgressHUD.h"
#import "IQKeyboardManager.h"
#import <YYText.h>
#import "STPickerDate.h"
#import "NinaPagerView.h"
#import "UIParameter.h"
#import "MJExtension.h"
#import "UUDatePicker.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "HYBNetworking.h"


//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)


//弱引用
#define LcWeakSelf __weak typeof(self) weakSelf = self;

//随机颜色
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//全局位置
#define ScreenSize    [UIScreen mainScreen].bounds.size
#define ScreenWidth   [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight  [[UIScreen mainScreen] bounds].size.height

//机型
#define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

//版本
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

//自定义错误提供给NSError使用
#define kCustomErrorDomain @"com.ETShop-for-iOS.ios"
typedef enum {
    eCustomErrorCodeFailure = 0
} eCustomErrorCode;

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

//清除背景色
#define CLEARCOLOR [UIColor clearColor]

//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]














