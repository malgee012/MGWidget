//
//  MGShowView.m
//  MGWidget
//
//  Created by acmeway on 2018/3/29.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGShowView.h"

@interface MGShowView ()

@property (strong, nonatomic) CAShapeLayer *indicatorLayer;

@property (strong, nonatomic) CAReplicatorLayer *replicatorLayer;

@end

@implementation MGShowView

+ (instancetype)showWithType:(MGEffectStyle)type
{
    MGShowView *show = [[self alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth * 1.5)];
    
    show.type = type;
    
    show.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.2];
    
    
    return show;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.layer addSublayer:self.replicatorLayer];
        
        [self.replicatorLayer addSublayer:self.indicatorLayer];
    }
    return self;
}

- (void)setType:(MGEffectStyle)type
{
    
    switch (type) {
        case MGEffectStyleDrop:
        {
            
            
            

        }
            break;
        case MGEffectStyleThimble:
        {
            
            _indicatorLayer.frame = CGRectMake((kScreenWidth - 10) * 0.5, 200, 10, 10);
            
            _indicatorLayer.cornerRadius = 5;
            
            _indicatorLayer.backgroundColor = MGColor.CGColor;
            
            _replicatorLayer.instanceCount = 30;
            
            _replicatorLayer.instanceDelay = 6.0 / 30;
            
            _replicatorLayer.instanceColor = MGColor.CGColor;
            
            _replicatorLayer.instanceGreenOffset = -0.03;
            
            _replicatorLayer.instanceRedOffset = -0.02;
            
            _replicatorLayer.instanceBlueOffset = -0.01;
            
        }
            break;
        case MGEffectStyleCircle:
        {
            _indicatorLayer.frame = CGRectMake(kScreenWidth/2.0, 200, 10, 10);
            
            _indicatorLayer.cornerRadius = 5;
            
            _indicatorLayer.transform = CATransform3DMakeScale(0.2, 0.2, 0.2);
            
            _indicatorLayer.backgroundColor = MGColor.CGColor;
            
            _replicatorLayer.instanceCount = 12;
            
            _replicatorLayer.instanceDelay = 1.0 / 12;
            
            CGFloat angle = (2 * M_PI)/self.replicatorLayer.instanceCount;
            
            _replicatorLayer.instanceColor = MGColor.CGColor;
            
            _replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 0.1);
            
            _replicatorLayer.instanceBlueOffset = -0.01;
            
            _replicatorLayer.instanceGreenOffset = -0.01;
            
        }
            break;
        case MGEffectStyleStrip:
        {
            _indicatorLayer.frame = CGRectMake(0, 0, 30, self.height * 0.8);
            
            _indicatorLayer.backgroundColor = MGColor.CGColor;
            
            _indicatorLayer.anchorPoint = CGPointMake(0, 0);

            _indicatorLayer.position = CGPointMake(self.x + 10, self.y + self.height * 0.8);
            
            _indicatorLayer.cornerRadius = 3;
            
            _replicatorLayer.instanceCount = 9;

            _replicatorLayer.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);

            _replicatorLayer.instanceDelay = 0.3;

            _replicatorLayer.masksToBounds = YES;

        }
            break;
        default:
            break;
    }
    
    [_indicatorLayer addAnimationWithEffectType:type];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.replicatorLayer.frame = self.bounds;
}

- (CAShapeLayer *)indicatorLayer
{
    if (!_indicatorLayer) {
        
        _indicatorLayer = [CAShapeLayer layer];
        
        _indicatorLayer.contentsScale = [[UIScreen mainScreen] scale];
    }
    return _indicatorLayer;
}

- (CAReplicatorLayer *)replicatorLayer
{
    if (!_replicatorLayer) {
        
        _replicatorLayer = [CAReplicatorLayer layer];
        
        _replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
        
        _replicatorLayer.shouldRasterize = YES;
        
        _replicatorLayer.rasterizationScale = [[UIScreen mainScreen] scale];
    }
    return _replicatorLayer;
}


@end
