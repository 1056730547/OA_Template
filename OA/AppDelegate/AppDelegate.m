//
//  AppDelegate.m
//  OA
//
//  Created by zzbf on 16/12/8.
//  Copyright © 2016年 zzbf. All rights reserved.
//
//          /╭-----------—--—-—--—╮\
//          ||                    ||
//          ||    I LOVE iOS!     ||
//          ||                    ||
//          ||  NSLog(@"hello")   ||
//          ||                    ||
//          |╰--------------------╯|\
//          ╰.___________________.╯—\--、_
//                  //___\\           )    、
//        ___________________________/___   \
//       /  oooooooooooooooo  .o.  oooo /, ,—\---╮
//      / ==ooooooooooooooo==.o.  ooo= // /   ▓  /
//     /_==__==========__==_ooo__ooo=_/' /______/
//     "=============================“
  

#import "AppDelegate.h"
#import "UMessage.h"
#import "UserLoginView.h"
#import "PrefixHeader.h"


@interface AppDelegate ()  <UIApplicationDelegate,UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    sleep(1.3);
    
    //初始化方法,也可以使用(void)startWithAppkey:(NSString *)appKey launchOptions:(NSDictionary * )launchOptions httpsenable:(BOOL)value;这个方法，方便设置https请求。
    [UMessage startWithAppkey:@"584a14882ae85b6761002681" launchOptions:launchOptions];
    
    //注册通知，如果要使用category的自定义策略，可以参考demo中的代码。或者1.4.0的文档
    [UMessage registerForRemoteNotifications];

    //打开日志，方便调试
    [UMessage setLogEnabled:NO];
    
    //是否允许SDK自动清空角标（默认开启）
    [UMessage setBadgeClear:NO];
    
    //开启键盘
    [[IQKeyboardManager sharedManager]setEnable:YES];
    
    [HYBNetworking enableInterfaceDebug:YES];
    
    [self replyPushNotificationAuthorization:application];
    
    // badge
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    badge--;
    badge = badge >= 0 ? badge : 0;
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;

    UserLoginView *log              = [[UserLoginView alloc]initWithNibName:@"UserLoginView" bundle:nil];
    self.window                     = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController  = log;
    self.window.backgroundColor     = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
    
}


#pragma mark - 申请通知权限
// 申请通知权限
- (void)replyPushNotificationAuthorization:(UIApplication *)application{
    
    if (IOS10_OR_LATER) {
        //iOS 10 later
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        //必须写代理，不然无法监听通知的接收与点击事件
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!error && granted) {
                //用户点击允许
                //NSLog(@"注册成功");
            }else{
                //用户点击不允许
                //NSLog(@"注册失败");
            }
        }];
        
        // 可以通过 getNotificationSettingsWithCompletionHandler 获取权限设置
        //之前注册推送服务，用户点击了同意还是不同意，以及用户之后又做了怎样的更改我们都无从得知，现在 apple 开放了这个 API，我们可以直接获取到用户的设定信息了。注意UNNotificationSettings是只读对象哦，不能直接修改！
        [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        //NSLog(@"========%@",settings);
        }];
    }else if (IOS8_OR_LATER){
        //iOS 8 - iOS 10系统
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }
}


#pragma mark iOS10新增：处理前台收到通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于前台时的远程推送接受
        //关闭友盟自带的弹出框
        [UMessage setAutoAlert:NO];
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
       
        NSLog(@"前台接收 远程 推送的消息：%@",userInfo);
        
    }else{
        
        //应用处于前台时的本地推送接受
        NSLog(@"前台接收  本地推送：%@",userInfo);
        
    }
    
    //当应用处于前台时提示设置，需要哪个可以设置哪一个
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}

#pragma mark iOS10新增：处理后台点击通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于后台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
    
         NSLog(@"程序后台点击 远程 推送进入的消息：%@",userInfo);
        
    }else{
        
        //应用处于后台时的本地推送接受
        NSLog(@"后台点击  本地推送");
        
        [self goToMssageViewControllerWith:userInfo];
        
    }
    
//    Warning: UNUserNotificationCenter delegate received call to -userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler: but the completion handler was never called.
    completionHandler(); // 系统要求执行这个方法
    
}


#pragma mark 跳转到指定界面
- (void)goToMssageViewControllerWith:(NSDictionary*)msgDic{
    
    
    NSString * targetStr                = [msgDic objectForKey:@"Type"];
    
    if ([targetStr isEqualToString:@"Log"]) {
        NewLogVC * VC                   = [[NewLogVC alloc]initWithNibName:@"NewLogVC" bundle:nil];
        UINavigationController * Nav    = [[UINavigationController alloc]initWithRootViewController:VC];
        [self.window.rootViewController presentViewController:Nav animated:YES completion:nil];
    

//        UINavigationController *nav= (UINavigationController *)self.window.rootViewController;
//        [nav pushViewController:VC animated:YES];
    
    }
}



#pragma mark 获取devicetoken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
   NSLog(@"%@", [[[[deviceToken description]
                stringByReplacingOccurrencesOfString: @"<" withString: @""]
                stringByReplacingOccurrencesOfString: @">" withString: @""]
                stringByReplacingOccurrencesOfString: @" " withString: @""]);
    
    NSString *device = [[[[deviceToken description]
                              stringByReplacingOccurrencesOfString: @"<" withString: @""]
                             stringByReplacingOccurrencesOfString: @">" withString: @""]
                             stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    NSUserDefaults *user = USER_DEFAULT;
    [user setObject:device forKey:@"deviceToken"];
    [user synchronize];
    
}





#pragma mark使用 UNNotification 本地通知
//-(void)registerNotification{
//    
//    // 使用 UNUserNotificationCenter 来管理通知
//    UNUserNotificationCenter* center        = [UNUserNotificationCenter currentNotificationCenter];
//    
//    //需创建一个包含待通知内容的 UNMutableNotificationContent 对象，注意不是 UNNotificationContent ,此对象为不可变对象。
//    UNMutableNotificationContent* content   = [[UNMutableNotificationContent alloc] init];
//    content.title = [NSString localizedUserNotificationStringForKey:@"本地推送!"            arguments:nil];
//    content.body  = [NSString localizedUserNotificationStringForKey:@"这是日志时间的推送哦" arguments:nil];
//    content.sound = [UNNotificationSound defaultSound];
//    content.badge = @666;
//    content.userInfo = @{@"Name":@"lican",
//                         @"Type":@"Nomel",
//                         @"Tag":@1};
//    
//    
//    ///////////////////////////////////////////// 一定时间之后  秒/////////////////////////////////////////////
//    
//    // 在 alertTime 后推送本地推送
//    //        UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
//    //                                                      triggerWithTimeInterval:alerTime repeats:NO];
//    
//    //////////////////////////////////////////// 定期推送  ////////////////////////////////////////////////////////
//    
//    NSDateComponents *components = [[NSDateComponents alloc] init];
//    components.year     = 2016;
//    components.month    = 12;
//    components.day      = 21;
//    components.hour     = 10;
//    components.minute   = 38;
//    
//    UNCalendarNotificationTrigger* trigger = [UNCalendarNotificationTrigger
//                                              triggerWithDateMatchingComponents:components repeats:NO];
//    
//    ////////////////////////////////////////////////////////////////////////////////////////////////////
//    
//    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
//                                                                          content:content trigger:trigger];
//    
//    
//    //添加推送成功后的处理！
//    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
//        
//    }];
//    
//}



- (void)applicationWillResignActive:(UIApplication *)application {}
- (void)applicationDidEnterBackground:(UIApplication *)application {}
- (void)applicationWillEnterForeground:(UIApplication *)application {}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}




@end
