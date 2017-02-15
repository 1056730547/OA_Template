//
//  TitleCell.m
//  OA
//
//  Created by zzbf on 16/12/26.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "TitleCell.h"

@implementation TitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    _Img.layer.cornerRadius = _Img.bounds.size.width/2;
    [_Img.layer setMasksToBounds:YES];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
