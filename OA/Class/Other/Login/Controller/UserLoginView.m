//
//  UserLoginView.m
//  OA
//
//  Created by zzbf on 16/12/12.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "UserLoginView.h"
#import "MaininterfaceView.h"
#import "AppDelegate.h"
#import "ValidatorUtil.h"
#import "PrefixHeader.h"

@interface UserLoginView ()
<UITextFieldDelegate>

@end

@implementation UserLoginView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUI];
    
}

-(void)loadUI{
    
    
//    UIBezierPath *maskPath  = [UIBezierPath bezierPathWithRoundedRect:_LogBtn.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:_LogBtn.bounds.size];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
//    //设置大小
//    maskLayer.frame         = _LogBtn.bounds;
//    //设置图形样子
//    maskLayer.path          = maskPath.CGPath;
//    _LogBtn.layer.mask      = maskLayer;
//    
    //登录圆角
    _LogBtn.layer.cornerRadius = 22;
    [_LogBtn.layer setMasksToBounds:YES];
    
    //光标设置
    [[UITextField appearance] setTintColor:[UIColor whiteColor]];
    
    [_Account setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [_Password setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
}





- (IBAction)LogAction:(id)sender {


    
        
//    NSError *error = nil;
//    if (![ValidatorUtil isValidMobile:_Account.text error:&error]) {
//        [self toast:[error localizedDescription]];
//        return;
//    }
//    
//    if (![ValidatorUtil isValidPassword:_Password.text error:&error]) {
//        [self toast:[error localizedDescription]];
//        return;
//    }
//    
////    
//    [self showLoadingView];
//    
//    [self performSelector:@selector(aa) withObject:self afterDelay:2];
//
    
   [self aabb];
    
//
    
   
    
    
}

-(void)aa{
    
    [self hideLoadingView];
    
    [self toast:@"登录成功"];
    
    [self performSelector:@selector(aabb) withObject:self afterDelay:2];
    
//    BACK(^{
//    
//    [HYBNetworking getWithUrl:@"123" refreshCache:YES params:nil success:^(id response) {
//        
//        
//        MAIN(^{
//           
//
//        
//        });
//        
//    } fail:^(NSError *error) {
//        
//    }];
//    
//    
//    
//    
//    });
    
    
    
  }

-(void)aabb{
    
    MaininterfaceView *Main         = [[MaininterfaceView alloc]initWithNibName:@"MaininterfaceView" bundle:nil];
    AppDelegate *apple              = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    UINavigationController *Nav     = [[UINavigationController alloc]initWithRootViewController:Main];
    apple.window.rootViewController = Nav;

}

-(void)viewWillDisappear:(BOOL)animated{
    
     [[UITextField appearance] setTintColor:[UIColor lightGrayColor]];
}



@end
