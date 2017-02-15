//
//  ProcessCell.h
//  OA
//
//  Created by zzbf on 16/12/26.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProcessCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *stateImg;
@property (weak, nonatomic) IBOutlet UIImageView *BoxImage;
@property (weak, nonatomic) IBOutlet UIButton *NameImg;

@end
