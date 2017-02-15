//
//  ProcessCell.m
//  OA
//
//  Created by zzbf on 16/12/26.
//  Copyright © 2016年 zzbf. All rights reserved.
//

#import "ProcessCell.h"

@implementation ProcessCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _NameImg.layer.cornerRadius = _NameImg.bounds.size.width/2;
    [_NameImg.layer setMasksToBounds:YES];
    
    UIImage* bubbleImage = [UIImage imageNamed:@"box"];
    _BoxImage.image = [bubbleImage stretchableImageWithLeftCapWidth:30 topCapHeight:30];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
