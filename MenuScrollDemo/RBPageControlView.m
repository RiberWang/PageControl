//
//  RBPageControlView.m
//  MenuScrollDemo
//
//  Created by Riber on 26/6/2019.
//  Copyright © 2019 Riber. All rights reserved.
//

#import "RBPageControlView.h"

@interface RBPageControlView ()

@property (nonatomic, strong) UIView *currentIndicatorView;

@end

@implementation RBPageControlView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        self.width = KWidth(60);
        self.height = KHeight(4);
        
        [self createUI];
    }
    
    return self;
}

- (void)createUI {
    // default set
    self.currentIndicatorWidth = KWidth(30);
    self.currentPageIndicatorColor = rgba(28, 188, 66, 1);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.height/2;

    self.currentIndicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.currentIndicatorWidth, self.height)];
    self.currentIndicatorView.layer.masksToBounds = YES;
    self.currentIndicatorView.layer.cornerRadius = self.currentIndicatorView.height/2;
    self.currentIndicatorView.backgroundColor = self.currentPageIndicatorColor;
    [self addSubview:self.currentIndicatorView];
}

- (void)setPageControlColor:(UIColor *)pageControlColor {
    _pageControlColor = pageControlColor;
    
    self.backgroundColor = pageControlColor;
}

- (void)setCurrentIndicatorWidth:(CGFloat)currentIndicatorWidth {
    if (currentIndicatorWidth > self.width) {
        if (self.width > 10) {
            currentIndicatorWidth = self.width - 10;
        }
        else {
            currentIndicatorWidth = self.width;
        }
    }
    _currentIndicatorWidth = currentIndicatorWidth;
    
    self.currentIndicatorView.width = currentIndicatorWidth;
}

- (void)setCurrentPageIndicatorColor:(UIColor *)currentPageIndicatorColor {
    _currentPageIndicatorColor = currentPageIndicatorColor;
    
    self.currentIndicatorView.backgroundColor = currentPageIndicatorColor;
}

- (void)setProgrss:(CGFloat)progrss {
    _progrss = progrss;
    
    self.currentIndicatorView.x = progrss;
}

- (CGFloat)offsetWidth {
    return self.width - self.currentIndicatorWidth;
}

@end
