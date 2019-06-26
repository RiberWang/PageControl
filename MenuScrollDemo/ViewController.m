//
//  ViewController.m
//  MenuScrollDemo
//
//  Created by Riber on 26/6/2019.
//  Copyright © 2019 Riber. All rights reserved.
//

#import "ViewController.h"
#import "RBPageControlView.h"
#import "RBMenuCVCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIView *menuBgView;
@property (nonatomic, strong) UICollectionView *menuCollectionView;
@property (nonatomic, strong) RBPageControlView *pageControl;
@property (nonatomic, strong) NSArray *menuImageArray;
@property (nonatomic, strong) NSArray *menuTitleArray;

@end

@implementation ViewController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI {
    self.menuBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREENW, 100)];
    self.menuBgView.backgroundColor = rgb(245, 245, 245);
    [self.view addSubview:self.menuBgView];

    [self.menuBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(100);
    }];

    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
    layOut.minimumLineSpacing = 0;
    layOut.minimumInteritemSpacing = 0;
    layOut.itemSize = CGSizeMake(KWidth(70), 90);
    layOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.menuCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(KWidth(10), 0, KSCREENW - 2*KWidth(10), 90) collectionViewLayout:layOut];
    self.menuCollectionView.backgroundColor = rgb(245, 245, 245);
    self.menuCollectionView.delegate = self;
    self.menuCollectionView.dataSource = self;
    self.menuCollectionView.showsHorizontalScrollIndicator = NO;
    [self.menuBgView addSubview:self.menuCollectionView];
    
    [self.menuCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.menuBgView);
        make.left.equalTo(self.menuBgView).offset(KWidth(10));
        make.right.equalTo(self.menuBgView).offset(-KWidth(10));
        make.height.mas_equalTo(90);
    }];
    
    // 注册cell
    [self.menuCollectionView registerClass:[RBMenuCVCell class] forCellWithReuseIdentifier:@"RBMenuCVCell"];

    self.pageControl = [[RBPageControlView alloc] initWithFrame:CGRectMake(0, 0, KWidth(80), KHeight(4))];
    self.pageControl.pageControlColor = rgba(224, 224, 224, 1);
    self.pageControl.currentPageIndicatorColor = rgba(28, 188, 66, 1);
    self.pageControl.currentIndicatorWidth = KWidth(50);
    [self.menuBgView addSubview:self.pageControl];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.menuCollectionView.mas_bottom);
        make.centerX.equalTo(self.menuBgView);
        make.size.mas_equalTo(CGSizeMake(KWidth(80), KHeight(4)));
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
#warning 重要逻辑 通过菜单的偏移量计算PageControl的偏移量
    /*
     pageControl的偏移量为pageControl的总宽度减去滑块的总宽度，
     同理scrollView的偏移量为scrollView的内容宽度减去scrollView的宽度。
     通过比例计算可得出pageControl的偏移量，
     即offsetX:scrollView可偏移的总距离=x:pageControl可偏移的总距离
     整理得x = offsetX*pageControl可偏移的总距离/scrollView可偏移的总距离
     */
    self.pageControl.progrss = offsetX*self.pageControl.offsetWidth/(scrollView.contentSize.width-self.menuCollectionView.width);
    NSLog(@"%f---%f---%f---%f--%f---%f", offsetX, scrollView.contentSize.width, self.menuCollectionView.width, scrollView.contentSize.width-self.menuCollectionView.width, offsetX*self.pageControl.offsetWidth/(scrollView.contentSize.width-self.menuCollectionView.width), KWidth(30));

}



@end
