//
//  RBMenuCell.m
//  ZNB_Country
//
//  Created by Riber on 10/9/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "RBMenuCell.h"
#import "RBPageControlView.h"
#import "RBGiftCVFlowLayout.h"
#import "RBMenuCVCell.h"

@interface RBMenuCell () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIView *menuBgView;
@property (nonatomic, strong) UICollectionView *menuCollectionView;
@property (nonatomic, strong) RBPageControlView *pageControl;

@property (nonatomic, strong) NSArray *menuImageArray;
@property (nonatomic, strong) NSArray *menuTitleArray;

@end


@implementation RBMenuCell

- (NSArray *)menuTitleArray {
    if (!_menuTitleArray) {
        _menuTitleArray = @[@"名优特供", @"商城", @"市场行情", @"农友圈", @"便民服务", @"新闻政策", @"农业技术", @"小视频", @"美丽乡村", @"农场直供", @"集贸市场"];
    }
    
    return _menuTitleArray;
}

- (NSArray *)menuImageArray {
    if (!_menuImageArray) {
        _menuImageArray = @[@"home_button_myzq", @"home_button_shop", @"home_button_schq", @"home_button_nyq", @"home_button_bmfw", @"home_button_xwzc", @"home_button_nyjs", @"home_button_xsp", @"home_button_mlxc", @"home_button_nczg", @"home_button_jmsc"];
    }
    
    return _menuImageArray;
}

+ (RBMenuCell *)cellForTableView:(UITableView *)tableView {
    RBMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellIdentify];
    if (!cell) {
        cell = [[RBMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuCellIdentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        
        [cell createUI];
    }
    
    return cell;
}

- (void)createUI {
    self.menuBgView = [[UIView alloc] init];
    [self.contentView addSubview:self.menuBgView];
    
    [self.menuBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, KWidth(15), 0, KWidth(15)));
    }];
    
    RBGiftCVFlowLayout *layOut = [[RBGiftCVFlowLayout alloc] init];
    layOut.itemCountRow = 6;
    layOut.minimumLineSpacing = 0;
    layOut.minimumInteritemSpacing = 0;
    layOut.itemSize = CGSizeMake(KWidth(70), 80);
    layOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.menuCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layOut];
    self.menuCollectionView.backgroundColor = [UIColor clearColor];
    self.menuCollectionView.delegate = self;
    self.menuCollectionView.dataSource = self;
    self.menuCollectionView.showsHorizontalScrollIndicator = NO;
    [self.menuBgView addSubview:self.menuCollectionView];
    
    [self.menuCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.menuBgView).insets(UIEdgeInsetsMake(0, 0, 4, 0));
//        make.left.right.top.equalTo(self.menuBgView);
//        make.bottom.equalTo(self.menuBgView).offset(-KHeight(4));
    }];
    
    // 注册cell
    [self.menuCollectionView registerClass:[RBMenuCVCell class] forCellWithReuseIdentifier:@"RBMenuCVCell"];
    
    self.pageControl = [[RBPageControlView alloc] initWithFrame:CGRectMake(0, 0, KWidth(60), 4)];
    self.pageControl.pageControlColor = rgba(224, 224, 224, 1);
    self.pageControl.currentPageIndicatorColor = rgba(0, 162, 135, 1);
    self.pageControl.currentIndicatorWidth = KWidth(30);
    [self.menuBgView addSubview:self.pageControl];

    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.menuBgView).offset(0);
        make.centerX.equalTo(self.menuBgView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KWidth(60), 4));
    }];
}
                                                                           
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.menuTitleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RBMenuCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RBMenuCVCell" forIndexPath:indexPath];
    cell.backgroundColor = rgb(245, 245, 245);
    cell.picImage.image = [UIImage imageNamed:self.menuImageArray[indexPath.row]];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@", self.menuTitleArray[indexPath.row]];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    self.pageControl.progrss = offsetX*self.pageControl.offsetWidth/(scrollView.contentSize.width-self.menuCollectionView.width);
}

@end
