//
//  MXCollectionViewCell.m
//  ccccc
//
//  Created by yww on 15/9/11.
//  Copyright (c) 2015年 yww. All rights reserved.
//

#import "MXCollectionViewCell.h"
#define MXRandomColor  [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.0]

@interface MXCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UIView *backView;
@end
@implementation MXCollectionViewCell

- (void)awakeFromNib {
   
}

- (void)setTitleTextWith:(NSString*)title
{
    self.backView.backgroundColor = MXRandomColor;
    self.leftView.backgroundColor = MXRandomColor;
    self.backView.layer.cornerRadius = 5;
    self.baseView.layer.cornerRadius = 5;
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    self.titleLabel.text = title;
    self.titleLabel.textColor = [UIColor blackColor];

}


@end
