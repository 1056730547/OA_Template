//
//  ApprovalrocessDetailVC.m
//  OA
//
//  Created by zzbf on 16/12/26.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "ApprovalrocessDetailVC.h"
#import "CustomCell.h"
#import "PrefixHeader.h"
#import "ZYKeyboardUtil.h"

@interface ApprovalrocessDetailVC ()

@property (strong, nonatomic) ZYKeyboardUtil *keyboardUtil;

@property (strong , nonatomic)ProcessCell   *ProcessCell;

@property (strong , nonatomic)LeaveCell     *leaveCell;

@property (strong , nonatomic)NSArray       *LCarrData;

@property (strong , nonatomic)NSArray       *ContentarrData;


@end

@implementation ApprovalrocessDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"审批";
    
    
    
    [_MyTable registerNib:[UINib nibWithNibName:@"ExamiTitleCell" bundle:nil] forCellReuseIdentifier:@"ExamiTitleCell"];
    
    [_MyTable registerNib:[UINib nibWithNibName:@"ProcessCell" bundle:nil] forCellReuseIdentifier:@"ProcessCell"];
    
    
    //Content Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"LeaveCell" bundle:nil] forCellReuseIdentifier:@"leaveCell"];
    
    
    
    _LCarrData       = @[@"发起申请",@"已拒绝（申请有瑕疵）",@"都决定书受到罚款多少疯狂的还是空间间发都决定书受到罚款多少疯狂的还是空间间发都决定书受到罚款多少疯狂的还是空间间发"];
    
    _ContentarrData  = @[@"都是罚款决定书受到罚款多少罚款决定书受到款决定书受到罚款多少疯狂的还是空间火疯狂的精华反馈记得喝咖啡粉红色的客户反馈都是罚款决定书受到罚款多少疯款决定书受到罚款多少疯狂的还是疯"];
    
    
    
    //////////
    //////////
    //////////
    YYTextView *NoteText                = [YYTextView new];
    NoteText.frame                      = _OpinionVC.bounds;
    NoteText.font                       = [UIFont systemFontOfSize:14];
    NoteText.textColor                  = [UIColor blackColor];
    NoteText.placeholderText            = @"请输入审批意见／非必填";
    NoteText.placeholderTextColor       = [UIColor lightGrayColor];
    
    [_OpinionVC addSubview:NoteText];

    
    
    //////////
    //////////
    //////////
    self.keyboardUtil = [[ZYKeyboardUtil alloc] init];
    __weak ApprovalrocessDetailVC *weakSelf = self;
    
    [_keyboardUtil setAnimateWhenKeyboardAppearAutomaticAnimBlock:^(ZYKeyboardUtil *keyboardUtil) {
        [keyboardUtil adaptiveViewHandleWithController:weakSelf adaptiveView:weakSelf.OpinionVC, nil];
    }];
    //////////
    //////////
    //////////
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 2)
    {
        return _LCarrData.count;
        
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ExamiTitleCellID       = @"ExamiTitleCell";
    
    static NSString *ProcessCellID          = @"ProcessCell";
    
    //Content Cell
    static NSString *leaveCellID            = @"leaveCell";
    
    
    ExamiTitleCell *titlecell               = [tableView dequeueReusableCellWithIdentifier:ExamiTitleCellID];
    
    _ProcessCell                            = [tableView dequeueReusableCellWithIdentifier:ProcessCellID];
    
    //Content Cell
    _leaveCell                              = [tableView dequeueReusableCellWithIdentifier:leaveCellID];
    
    
  
    if (!titlecell)     titlecell           = [[[NSBundle mainBundle]loadNibNamed:@"ExamiTitleCell" owner:nil options:nil]lastObject];
   
    if (!_ProcessCell)  _ProcessCell        = [[[NSBundle mainBundle]loadNibNamed:@"ProcessCell" owner:nil options:nil]lastObject];
    
    //Content Cell
    if (!_leaveCell)    _leaveCell          = [[[NSBundle mainBundle]loadNibNamed:@"LeaveCell" owner:nil options:nil]lastObject];
    
    
    
    if (indexPath.section == 0){
        
        return titlecell;
    }
    else if (indexPath.section == 1){
        
        [self leaveCell:_leaveCell atIndexPath:indexPath];
        
        return _leaveCell;
    }
    else{
        
        [self configureCell:_ProcessCell atIndexPath:indexPath];
        
        return _ProcessCell;
    }
    
}

    
    







///////////////////
- (void)leaveCell:(LeaveCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    
    cell.Reasonleave.text = self.ContentarrData[indexPath.row];
}

- (void)configureCell:(ProcessCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        cell.stateImg.image = [UIImage imageNamed:@"yes"];
    } else {
        cell.stateImg.image = [UIImage imageNamed:@"no"];
    }
    
    cell.content.text = self.LCarrData[indexPath.row];
}




///////////////
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        return 80;
        
    }else if (indexPath.section == 1) {
        
        return [tableView fd_heightForCellWithIdentifier:@"leaveCell"  configuration:^(id cell) {
            
            [self leaveCell:cell atIndexPath:indexPath];
            
        }];
        
    }else{
        
        return [tableView fd_heightForCellWithIdentifier:@"ProcessCell" configuration:^(id cell) {
            
            [self configureCell:cell atIndexPath:indexPath];
            
        }];
        
    }
}



@end
