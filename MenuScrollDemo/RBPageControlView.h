//
//  RBPageControlView.h
//  MenuScrollDemo
//
//  Created by Riber on 26/6/2019.
//  Copyright © 2019 Riber. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBPageControlView : UIView

@property (nonatomic, assign) CGFloat progrss; /**< 偏移量 */
@property(nullable, nonatomic,strong) UIColor *pageControlColor; /**< 底部背景颜色 也可直接设置view的背景色 */
@property(nullable, nonatomic,strong) UIColor *currentPageIndicatorColor; /**< 滑块颜色 */
@property (nonatomic, assign) CGFloat currentIndicatorWidth; /**< 滑块宽度 */
@property (nonatomic, assign) CGFloat offsetWidth; /**< 总偏移距离 计算偏移量 */

@end

NS_ASSUME_NONNULL_END
