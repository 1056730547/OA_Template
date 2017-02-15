//
//  ExaminappDetailVC.m
//  OA
//
//  Created by zzbf on 16/12/15.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "ExaminappDetailVC.h"
#import "CustomCell.h"
#import "PrefixHeader.h"

@interface ExaminappDetailVC ()

@property (strong , nonatomic)ProcessCell   *ProcessCell;

@property (strong , nonatomic)LeaveCell     *leaveCell;

@property (strong , nonatomic)ReportCell     *ReportCell;

@property (strong , nonatomic)DemandhumanCell     *DemandhumanCell;

@property (strong , nonatomic)BusinessapplicationCell     *BusinessapplicationCell;

@property (strong , nonatomic)NotpunchCell     *NotpunchCell;

@property (strong , nonatomic)GooutregistrationCell     *GooutregistrationCell;

@property (strong , nonatomic)BillCell     *BillCell;

@property (strong , nonatomic)OvertimeCell     *OvertimeCell;

@property (strong , nonatomic)OffCell     *OffCell;


@property (strong , nonatomic)NSArray       *LCarrData;

@property (strong , nonatomic)NSArray       *ContentarrData;

@end

@implementation ExaminappDetailVC



- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"申请";
    
    //顶部标题Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"TitleCell" bundle:nil] forCellReuseIdentifier:@"TitleCell"];
    //底部具体流程Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"ProcessCell" bundle:nil] forCellReuseIdentifier:@"ProcessCell"];
    
    
    ///////////////////中间具体内容Cell
    
    //请假申请Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"LeaveCell" bundle:nil] forCellReuseIdentifier:@"leaveCell"];
    //招聘职位Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"DemandhumanCell" bundle:nil] forCellReuseIdentifier:@"DemandhumanCell"];
    //呈报审批Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"ReportCell" bundle:nil] forCellReuseIdentifier:@"ReportCell"];
    //出差申请Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"BusinessapplicationCell" bundle:nil] forCellReuseIdentifier:@"BusinessapplicationCell"];
    //未打卡Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"NotpunchCell" bundle:nil] forCellReuseIdentifier:@"NotpunchCell"];
    //外出登记Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"GooutregistrationCell" bundle:nil] forCellReuseIdentifier:@"GooutregistrationCell"];
    //请款单Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"BillCell" bundle:nil] forCellReuseIdentifier:@"BillCell"];
    //加班申请Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"OvertimeCell" bundle:nil] forCellReuseIdentifier:@"OvertimeCell"];
    //调休Cell
    [_MyTable registerNib:[UINib nibWithNibName:@"OffCell" bundle:nil] forCellReuseIdentifier:@"OffCell"];
    
    
    
    
    
    
    _LCarrData       = @[@"发起申请",
                         @"已拒绝（申请有瑕疵）",
                         @"都是罚款决多少疯款决定书受到罚款多少疯狂的还是空间间发都决定书受到罚款多少疯狂的还是空间间发都决定书受到罚款多少疯狂的还是空间间发"];
    
    _ContentarrData  = @[@"都是罚款定书受到罚款多少疯狂馈记得喝咖啡粉红色的客户反馈都是馈记得喝咖啡粉红色的客户反馈都是的还是疯",
                         @"都都是罚款决是疯是罚款决定书受到罚款多少罚款决定书受到款决定书受到罚款多少疯狂的还是空间火疯狂的精华反馈记得喝咖啡粉红色的客户反馈都是罚款决定书受到罚款多少疯款决定书受到罚款多少疯狂的还是疯"];
    
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
    
    static NSString *titlecellID                        = @"TitleCell";
    static NSString *ProcessCellID                      = @"ProcessCell";
    
    //Content Cell
    static NSString *leaveCellID                        = @"leaveCell";
    static NSString *DemandhumanCellID                  = @"DemandhumanCell";
    static NSString *ReportCellID                       = @"ReportCell";
    static NSString *BusinessapplicationCellID          = @"BusinessapplicationCell";
    static NSString *NotpunchCellID                     = @"NotpunchCell";
    static NSString *GooutregistrationCellID            = @"GooutregistrationCell";
    static NSString *BillCellID                         = @"BillCell";
    static NSString *OvertimeCellID                     = @"OvertimeCell";
    static NSString *OffCellID                          = @"OffCell";
    
    
    TitleCell *titlecell                = [tableView dequeueReusableCellWithIdentifier:titlecellID];
    _ProcessCell                        = [tableView dequeueReusableCellWithIdentifier:ProcessCellID];
    
    
    
    //Content Cell
    _leaveCell                          = [tableView dequeueReusableCellWithIdentifier:leaveCellID];
    _DemandhumanCell                    = [tableView dequeueReusableCellWithIdentifier:DemandhumanCellID];
    _ReportCell                         = [tableView dequeueReusableCellWithIdentifier:ReportCellID];
    _BusinessapplicationCell            = [tableView dequeueReusableCellWithIdentifier:BusinessapplicationCellID];
    _NotpunchCell                       = [tableView dequeueReusableCellWithIdentifier:NotpunchCellID];
    _GooutregistrationCell              = [tableView dequeueReusableCellWithIdentifier:GooutregistrationCellID];
    _BillCell                           = [tableView dequeueReusableCellWithIdentifier:BillCellID];
    _OvertimeCell                       = [tableView dequeueReusableCellWithIdentifier:OvertimeCellID];
    _OffCell                            = [tableView dequeueReusableCellWithIdentifier:OffCellID];
    
    
    
    
    
    
    
    
    if (!titlecell)     titlecell       = [[[NSBundle mainBundle]loadNibNamed:@"TitleCell" owner:nil options:nil]lastObject];
    if (!_ProcessCell)  _ProcessCell    = [[[NSBundle mainBundle]loadNibNamed:@"ProcessCell" owner:nil options:nil]lastObject];
    
    
    
    
    
    //Content Cell
    if (!_leaveCell)                    _leaveCell                      = [[[NSBundle mainBundle]loadNibNamed:@"LeaveCell" owner:nil options:nil]lastObject];
    if (!_DemandhumanCell)              _DemandhumanCell                = [[[NSBundle mainBundle]loadNibNamed:@"DemandhumanCell" owner:nil options:nil]lastObject];
    if (!_ReportCell)                   _ReportCell                     = [[[NSBundle mainBundle]loadNibNamed:@"ReportCell" owner:nil options:nil]lastObject];
    if (!_BusinessapplicationCell)      _BusinessapplicationCell        = [[[NSBundle mainBundle]loadNibNamed:@"BusinessapplicationCell" owner:nil options:nil]lastObject];
    if (!_NotpunchCell)                 _NotpunchCell                   = [[[NSBundle mainBundle]loadNibNamed:@"NotpunchCell" owner:nil options:nil]lastObject];
    if (!_GooutregistrationCell)        _GooutregistrationCell          = [[[NSBundle mainBundle]loadNibNamed:@"GooutregistrationCell" owner:nil options:nil]lastObject];
    if (!_BillCell)                     _BillCell                       = [[[NSBundle mainBundle]loadNibNamed:@"BillCell" owner:nil options:nil]lastObject];
    if (!_OvertimeCell)                 _OvertimeCell                   = [[[NSBundle mainBundle]loadNibNamed:@"OvertimeCell" owner:nil options:nil]lastObject];
    if (!_OffCell)                      _OffCell                        = [[[NSBundle mainBundle]loadNibNamed:@"OffCell" owner:nil options:nil]lastObject];
    

    
   
    if (indexPath.section == 0){
        
        return titlecell;
        
    }else if (indexPath.section == 1){
        
        if ([_Type isEqualToString:@"1"]) {
            
//            [self leaveCell:_leaveCell atIndexPath:indexPath];
//            return _leaveCell;
            
//            [self ReportCell:_ReportCell atIndexPath:indexPath];
//            return  _ReportCell;
            
//            [self BusinessapplicationCell:_BusinessapplicationCell atIndexPath:indexPath];
//            return  _BusinessapplicationCell;
            
//            [self NotpunchCell:_NotpunchCell atIndexPath:indexPath];
//            return  _NotpunchCell;
            
//            [self GooutregistrationCell:_GooutregistrationCell atIndexPath:indexPath];
//            return  _GooutregistrationCell;
            
//            [self BillCell:_BillCell atIndexPath:indexPath];
//            return  _BillCell;
            
//            [self OvertimeCell:_OvertimeCell atIndexPath:indexPath];
//            return  _OvertimeCell;
            
            [self OffCell:_OffCell atIndexPath:indexPath];
            return  _OffCell;
            
            
        } else {
            
            [self DemandhumanCell:_DemandhumanCell atIndexPath:indexPath];
            return _DemandhumanCell;
        }

        
        
    }else{
        
        [self configureCell:_ProcessCell atIndexPath:indexPath];
        return _ProcessCell;
    }
    
}

#pragma  mark Load Cell Data

//调休申请Cell
- (void)OffCell:(OffCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.ContentText.text = self.LCarrData[2];
}

//加班申请Cell
- (void)OvertimeCell:(OvertimeCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.ContentText.text = self.LCarrData[2];
}

//请款单Cell
- (void)BillCell:(BillCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.ContentText.text = self.LCarrData[2];
}

//外出登记Cell
- (void)GooutregistrationCell:(GooutregistrationCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.ContentText.text = self.LCarrData[2];
}

//未打卡Cell
- (void)NotpunchCell:(NotpunchCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.ContentText.text = self.LCarrData[2];
}

//出差申请Cell
- (void)BusinessapplicationCell:(BusinessapplicationCell *)cell atIndexPath:(NSIndexPath *)indexPath {
   cell.ContentText.text = self.LCarrData[2];
}

//招聘职位Cell
- (void)DemandhumanCell:(DemandhumanCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.QualifiedText.text = self.ContentarrData[0];
    cell.ReasonText.text = self.ContentarrData[1];
}

//呈报审批Cell
- (void)ReportCell:(ReportCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.ContentText.text = self.LCarrData[2];
}

//请假申请Cell
- (void)leaveCell:(LeaveCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.Reasonleave.text = self.ContentarrData[1];
}

//底部流程Cell
- (void)configureCell:(ProcessCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        cell.stateImg.image = [UIImage imageNamed:@"yes"];
    } else {
        cell.stateImg.image = [UIImage imageNamed:@"no"];
    }
    
    cell.content.text = self.LCarrData[indexPath.row];
}



#pragma  mark Height  For Row
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {               ///////////Title
        
        return 80;
        
    }else if (indexPath.section == 1) {         ///////////////内容
        
        
        if ([_Type isEqualToString:@"1"]) {          //不同类型 展示不同界面
            
//            return [tableView fd_heightForCellWithIdentifier:@"leaveCell"  configuration:^(id cell) {
//                [self leaveCell:cell atIndexPath:indexPath];
//            }];

//            return [tableView fd_heightForCellWithIdentifier:@"ReportCell"  configuration:^(id cell) {
//                [self ReportCell:cell atIndexPath:indexPath];
//            }];
        
//            return [tableView fd_heightForCellWithIdentifier:@"BusinessapplicationCell"  configuration:^(id cell) {
//                [self BusinessapplicationCell:cell atIndexPath:indexPath];
//            }];
        
//            return [tableView fd_heightForCellWithIdentifier:@"NotpunchCell"  configuration:^(id cell) {
//                [self NotpunchCell:cell atIndexPath:indexPath];
//            }];
            
//            return [tableView fd_heightForCellWithIdentifier:@"GooutregistrationCell"  configuration:^(id cell) {
//                [self GooutregistrationCell:cell atIndexPath:indexPath];
//            }];
            
//            return [tableView fd_heightForCellWithIdentifier:@"BillCell"  configuration:^(id cell) {
//                [self BillCell:cell atIndexPath:indexPath];
//            }];
            
//            return [tableView fd_heightForCellWithIdentifier:@"OvertimeCell"  configuration:^(id cell) {
//                [self OvertimeCell:cell atIndexPath:indexPath];
//            }];
            
            return [tableView fd_heightForCellWithIdentifier:@"OffCell"  configuration:^(id cell) {
                [self OffCell:cell atIndexPath:indexPath];
            }];
            
            
        } else {                                //不同类型 展示不同界面
            
            
            
            
            return [tableView fd_heightForCellWithIdentifier:@"DemandhumanCell"  configuration:^(id cell) {
                [self DemandhumanCell:cell atIndexPath:indexPath];
            }];
            
            
        }

    }else{                                      /////////////////////流程
        
        
        return [tableView fd_heightForCellWithIdentifier:@"ProcessCell" configuration:^(id cell) {
            [self configureCell:cell atIndexPath:indexPath];
        }];
  
        
    }
}




@end
