//
//  RBMenuCVCell.m
//  MenuScrollDemo
//
//  Created by Riber on 26/6/2019.
//  Copyright © 2019 Riber. All rights reserved.
//

#import "RBMenuCVCell.h"

@implementation RBMenuCVCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI {
    self.picImage = [[UIImageView alloc] init];
    self.picImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.picImage];
    [self.picImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).offset(0);
        make.centerY.equalTo(self.contentView).offset(-14.5);
        make.height.mas_equalTo(48);

    }];

    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:KWidth(13)];
    self.nameLabel.textColor = rgba(48, 49, 51, 1);
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.numberOfLines = 0;
    [self.contentView addSubview:self.nameLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(3);
        make.right.equalTo(self.contentView).offset(-3);
        make.top.equalTo(self.picImage.mas_bottom).offset(10);
    }];
}

@end
