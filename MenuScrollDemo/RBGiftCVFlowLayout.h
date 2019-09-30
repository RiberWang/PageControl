//
//  RBGiftCVFlowLayout.h
//  ZNB_Country
//
//  Created by Riber on 9/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBGiftCVFlowLayout : UICollectionViewFlowLayout

// 每行显示几个
@property (nonatomic) NSUInteger itemCountRow;
// 显示多少行
@property (nonatomic) NSUInteger rowCount;

@property (strong, nonatomic) NSMutableArray *allAttributes;


@end

NS_ASSUME_NONNULL_END
