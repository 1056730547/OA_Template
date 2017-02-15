// The MIT License (MIT)
//
//  BaseController.h
//  ETShop-for-iOS
//
//  Created by EleTeam(Tony Wong) on 15/06/03.
//  Copyright © 2015年 EleTeam. All rights reserved.
//
//  @email 908601756@qq.com
//
//  @license The MIT License (MIT)
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController


#pragma mark - self.navigationController

- (void)setNavLeftBarButtonItem;

- (void)popSelfController;

#pragma mark - _loadingView show and hide

- (void)showLoadingView;

- (void)hideLoadingView;

#pragma mark - toast

-(void)toast:(NSString *)title;

-(void)toast:(NSString *)title seconds:(int)seconds;

-(void)toastWithError:(NSError *)error;



@end
