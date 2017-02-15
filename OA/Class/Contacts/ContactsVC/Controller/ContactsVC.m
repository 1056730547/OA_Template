//
//  ContactsVC.m
//  OA
//
//  Created by zzbf on 16/12/15.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "ContactsVC.h"
#import "PrefixHeader.h"
#import "PersonalinformationVC.h"
#import "NSArray+SortContact.h"
#import "ContactsCell.h"
#import "SearchModel.h"


@interface ContactsVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) NSArray* contacts;
@property (nonatomic, copy) NSArray* grouppedContacts;
@property (nonatomic, copy) NSArray* headers;


@property (nonatomic , strong) NSMutableArray *searchArr;



@end

@implementation ContactsVC




- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.navigationItem.title = @"联系人";
    
    
    
    // sectionIndex样式
    _MyTable.sectionIndexColor = [UIColor grayColor];
    _MyTable.sectionIndexBackgroundColor = [UIColor clearColor];
    _MyTable.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _MyTable.rowHeight = 50;
    _MyTable.tableFooterView = [UIView new];
    
   
    [_MyTable registerNib:[UINib nibWithNibName:@"ContactsCell" bundle:nil] forCellReuseIdentifier:@"ContactsCell"];
    
    
    
    _contacts       = @[@"阿伟",@"阿姨",@"阿三",@"蔡芯",@"成龙",@"陈鑫",@"陈丹",@"成名",@"芳仔",@"房祖名",@"方大同",@"芳芳",@"范伟",@"郭靖",@"郭美美",@"过儿",@"过山车",@"何仙姑",@"和珅",@"郝歌",@"好人",@"妈妈",@"毛主席",@"孙中山",@"沈冰",@"婶婶",@"涛涛",@"淘宝",@"套娃",@"小二",@"夏紫薇",@"许巍",@"许晴",@"周恩来",@"周杰伦",@"张柏芝",@"张大仙",@"李世民"];
    
    
    
    
    
    [self.contacts sortContactTOTitleAndSectionRow_A_EC:^(BOOL isSuccess, NSArray* titleArray, NSArray* rowArray) {
        if (!isSuccess)
            return;
        
        self.grouppedContacts = rowArray;
        self.headers = titleArray;
    }];

    
    
}





#pragma mark UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
     return _headers.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_grouppedContacts[section]count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellid = @"ContactsCell";
    
    ContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ContactsCell" owner:nil options:nil]lastObject];

    }
   
    cell.Name.text = _grouppedContacts[indexPath.section][indexPath.row];
    cell.Img.image = [UIImage imageNamed:@"Yuan"];
    
    
//    if (self.searchController.active){
//        
//        SearchModel *model = _searchArr[indexPath.row];
//        cell.Name.text = model.Title;
//        
//    }else{
//        
//        SearchModel *model = _data[indexPath.row];
//        cell.Name.text = model.Title;
//
//        
//    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PersonalinformationVC *person = [[PersonalinformationVC alloc]initWithNibName:@"PersonalinformationVC" bundle:nil];
    [self.navigationController pushViewController:person animated:YES];
    
}


//////////
- (UIView*)tableView:(UITableView*)tableView
viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc]
                          initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    headerView.backgroundColor = [UIColor colorWithWhite:.95 alpha:1];
    
    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.textColor = [UIColor lightGrayColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:14];
    headerLabel.text = self.headers[section];
    headerLabel.frame = CGRectMake(10, 0, headerView.bounds.size.width,
                                   headerView.bounds.size.height);
    
    [headerView addSubview:headerLabel];
    return headerView;
}

- (CGFloat)tableView:(UITableView*)tableView
heightForHeaderInSection:(NSInteger)section
{
    return  20;
}

- (NSArray<NSString*>*)sectionIndexTitlesForTableView:(UITableView*)tableView
{
    return self.headers;
}




@end
