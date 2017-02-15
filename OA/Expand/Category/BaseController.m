//
//  BaseController.m
//  ETShop-for-iOS
//
//  Created by EleTeam(Tony Wong) on 15/06/03.
//  Copyright © 2015年 EleTeam. All rights reserved.
//
//  @email 908601756@qq.com
//
//  @license The MIT License (MIT)
//

#import "BaseController.h"
#import "PrefixHeader.h"


@interface BaseController ()
{
    MBProgressHUD *loadHUD;
    
}


@end

@implementation BaseController

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden  = NO;
    
    self.navigationController.navigationBar.translucent = NO;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBarButtonItem];
    
}

#pragma mark - self.navigationController

- (void)setNavLeftBarButtonItem
{
    UINavigationBar *bar    = [UINavigationBar appearance];
    
    //设置显示的颜色
    
    bar.barTintColor        =   RGBA(240, 240, 240, 1);
    //设置字体颜色
    
    bar.tintColor           = [UIColor blackColor];
    
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back"] style:UIBarButtonItemStyleDone target:self action:@selector(popSelfController)];
}

- (void)popSelfController
{
    [self.navigationController popViewControllerAnimated:YES];
    
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - _loadingView show and hide

- (void)showLoadingView
{
    loadHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    loadHUD.mode = MBProgressHUDModeIndeterminate;
    loadHUD.removeFromSuperViewOnHide = YES;
    
}

- (void)hideLoadingView
{
    [loadHUD showAnimated:YES whileExecutingBlock:^{
        sleep(0);
    } completionBlock:^{
        [loadHUD removeFromSuperview];
    }];

}


#pragma mark - toast

-(void)toast:(NSString *)title
{
    int seconds = 2;
    [self toast:title seconds:seconds];
}

-(void)toast:(NSString *)title seconds:(int)seconds
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.detailsLabelText = title;
    HUD.mode = MBProgressHUDModeText;
    
    //指定距离中心点的X轴和Y轴的位置，不指定则在屏幕中间显示
    //    HUD.yOffset = 100.0f;
    //    HUD.xOffset = 100.0f;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(seconds);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}

-(void)toastWithError:(NSError *)error
{
    NSString *errorStr = [NSString stringWithFormat:@"网络出错：%@，code：%ld", error.domain, (long)error.code];
    [self toast:errorStr];
}







@end
