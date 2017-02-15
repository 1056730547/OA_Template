//
//  StorageUtil.h
//  ETShop-for-iOS
//
//  Created by EleTeam(Tony Wong) on 15/8/22.
//  Copyright © 2015年 EleTeam. All rights reserved.
//
//  @email 908601756@qq.com
//
//  @license The MIT License (MIT)
//

#import <Foundation/Foundation.h>

@interface StorageUtil : NSObject


//用户是否已经登录, 由app传user_id和access_token过来
+ (void)saveAccessToken:(NSString *)access_token;
+ (NSString *)getAccessToken;

//用户信息
+ (void)saveUserId:(NSNumber *)user_id;
+ (NSNumber *)getUserId;

+ (void)saveUserMobile:(NSString *)user_mobile;
+ (NSString *)getUserMobile;

+ (void)saveUserLevel:(NSNumber *)user_level;
+ (NSNumber *)getUserLevel;

+ (void)saveUserLevelLabel:(NSString *)user_level_label;
+ (NSString *)getUserLevelLabel;

@end
