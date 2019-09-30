//
//  RBMenuCell.h
//  ZNB_Country
//
//  Created by Riber on 10/9/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *menuCellIdentify = @"RBMenuCell";

@interface RBMenuCell : UITableViewCell

@property (nonatomic, strong) NSDictionary *dataDic;
@property (nonatomic, copy) void(^menueClickBlock) (NSInteger tag, NSString *title);

+ (RBMenuCell *)cellForTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
