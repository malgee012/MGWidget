//
//  MGLoaderView.m
//  MGWidget
//
//  Created by acmeway on 2018/3/30.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGLoaderView.h"
#import "MGLoadDotView.h"
#import "MGWorshipView.h"
#import "MGChainView.h"
#import "MGAlterView.h"
@interface MGLoaderView ()

@property (strong, nonatomic) CAShapeLayer *indicatorLayer;

@property (strong, nonatomic) CAReplicatorLayer *replicatorLayer;

@end
@implementation MGLoaderView

+ (instancetype)loader
{
    MGLoaderView *loader = [[MGLoaderView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    return loader;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
        
        [self.layer addSublayer:self.replicatorLayer];
        
        [self.replicatorLayer addSublayer:self.indicatorLayer];
        
//        CGFloat kMargin = 0.5;
//
//        CALayer *line = [[CALayer alloc] init];
//
//        line.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
//
//        line.frame = CGRectMake((self.width - kMargin) * 0.5, 0, kMargin, self.height);
//
//        [self.layer addSublayer:line];
//
//        CALayer *line2 = [[CALayer alloc] init];
//
//        line2.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
//
//        line2.frame = CGRectMake(0, (self.height - kMargin) * 0.5, self.width, kMargin);
//
//        [self.layer addSublayer:line2];
    }
    return self;
}

- (void)setStyle:(MGLoaderStyle)style
{
    switch (style) {
        case MGLoaderStyleTriangle:
            {
                _indicatorLayer.frame           = CGRectMake((self.width - 8) / 2.0, self.width * 0.3, 8, 8);

                _indicatorLayer.cornerRadius    = 4;

                _indicatorLayer.backgroundColor = kBgColor.CGColor;

                _replicatorLayer.instanceCount  = 3;

                _replicatorLayer.instanceDelay  = 2.0 / 3.0;

                _replicatorLayer.instanceColor  = kBgColor.CGColor;

            }
            break;
        case MGLoaderStyleCationDot:
        {
            MGLoadDotView *loadView = [[MGLoadDotView alloc] initWithFrame:self.bounds];

            [loadView showAnimationView];

            [self addSubview:loadView];
        }
            break;
        case MGLoaderStyleExpandDot:
        {
            _indicatorLayer.frame              = CGRectMake(20, (self.height - 6) * 0.5, 6, 6);

            _indicatorLayer.cornerRadius       = 3;

            _indicatorLayer.backgroundColor    = kBgColor.CGColor;

            _replicatorLayer.instanceCount     = 5;

            _replicatorLayer.instanceDelay     = 1.0 / 5;

            _replicatorLayer.instanceColor     = kBgColor.CGColor;

            _replicatorLayer.instanceTransform = CATransform3DMakeTranslation(12, 0, 0);

        }
            break;
        case MGLoaderStyleShipDot:
        {
            MGWorshipView *shipView = [[MGWorshipView alloc] initWithFrame:self.bounds];
            
            [shipView showAnimationView];
            
            [self addSubview:shipView];
        }
            break;
        case MGLoaderStyleChain:
        {
            MGChainView *chainView = [[MGChainView alloc] initWithFrame:self.bounds];
            
            [chainView showAnimationView];
            
            [self addSubview:chainView];
            
        }
            break;
        case MGLoaderStyleAlter:
        {
            MGAlterView *alterView = [[MGAlterView alloc] initWithFrame:self.bounds];
            
            [alterView showAnimationView];
            
            [self addSubview:alterView];
        }
            break;
     
    }
    
    [_indicatorLayer addAnimationWithLoaderStyle:style];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.replicatorLayer.frame = self.bounds;
}

- (CAShapeLayer *)indicatorLayer
{
    if (!_indicatorLayer) {

        _indicatorLayer               = [CAShapeLayer layer];

        _indicatorLayer.contentsScale = [[UIScreen mainScreen] scale];
    }
    return _indicatorLayer;
}

- (CAReplicatorLayer *)replicatorLayer
{
    if (!_replicatorLayer) {

        _replicatorLayer                    = [CAReplicatorLayer layer];

        _replicatorLayer.backgroundColor    = [UIColor clearColor].CGColor;

        _replicatorLayer.shouldRasterize    = YES;

        _replicatorLayer.rasterizationScale = [[UIScreen mainScreen] scale];
    }
    return _replicatorLayer;
}
@end
