//
//  ExaminationapprovalVC.m
//  OA
//
//  Created by zzbf on 16/12/15.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "ExaminationapprovalVC.h"
#import "PrefixHeader.h"
#import "MyapplicationVC.h"
#import "MyapprovalVC.h"

@interface ExaminationapprovalVC ()<NinaPagerViewDelegate>
@property (nonatomic, strong) NinaPagerView *ninaPagerView;



@end

@implementation ExaminationapprovalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"审批";
    
    [self.view addSubview:self.ninaPagerView];
    
}

#pragma mark - LazyLoad
- (NinaPagerView *)ninaPagerView {
    if (!_ninaPagerView) {
        //Need You Edit
        NSArray *titleArray = [self ninaTitleArray];
        //Three choices
        NSArray *vcsArray   = [self ninaVCsArray];
        /**
         *  创建ninaPagerView，控制器第一次是根据您划的位置进行相应的添加的，类似网易新闻虎扑看球等的效果，后面再滑动到相应位置时不再重新添加，如果想刷新数据，您可以在相应的控制器里加入刷新功能。需要注意的是，在创建您的控制器时，设置的frame为FUll_CONTENT_HEIGHT，即全屏高减去导航栏高度，如果这个高度不是您想要的，您可以去在下面的frame自定义设置。
         *  A tip you should know is that when init the VCs frames,the default frame i set is FUll_CONTENT_HEIGHT,it means fullscreen height - NavigationHeight - TabbarHeight.If the frame is not what you want,just set frame as you wish.
         */
        CGRect pagerRect                    = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        _ninaPagerView                      = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithVCs:vcsArray];
        _ninaPagerView.ninaPagerStyles      = NinaPagerStyleBottomLine;
        _ninaPagerView.ninaDefaultPage      = 0;
        _ninaPagerView.loadWholePages       = YES;
        
        _ninaPagerView.unSelectTitleColor   = [UIColor blackColor];
        _ninaPagerView.selectTitleColor     = RGB(110, 195, 239);
        _ninaPagerView.titleFont            = 16;
        _ninaPagerView.underlineColor       = RGB(110, 195, 239);
        
    }
    
    return _ninaPagerView;
}

#pragma mark - NinaParaArrays
/**
 *  上方显示标题(您需要注意的是，虽然框架中对长标题进行了优化处理，但是建议您设置标题时汉字的长度不要超过10)。
 *  Titles showing on the topTab
 *
 *  @return Array of titles.
 */
- (NSArray *)ninaTitleArray {
    return @[
             
             @"我的申请",
             @"我的审批",
             
             ];
}

/**
 *  WithVCs传入方法1：每个标题下对应的控制器，只需将您创建的控制器类名加入下列数组即可(注意:数量应与上方的titles数量保持一致，若少于titles数量，下方会打印您缺少相应的控制器，同时默认设置的最大控制器数量为10)  。
 *  ViewControllers to the titles on the topTab.Just add your VCs' Class Name to the array. Wanning:the number of ViewControllers should equal to the titles.Meanwhile,default max VC number is 10.
 *
 *  @return Array of controllers' class names.
 */
- (NSArray *)ninaVCsArray {
    return @[
             
             @"MyapplicationVC",
             @"MyapprovalVC",
             
             ];
}




@end
