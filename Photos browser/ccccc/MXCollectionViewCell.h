//
//  MXCollectionViewCell.h
//  ccccc
//
//  Created by yww on 15/9/11.
//  Copyright (c) 2015年 yww. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setTitleTextWith:(NSString*)title;
@end
