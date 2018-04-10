//
//  MGWorshipView.m
//  MGWidget
//
//  Created by acmeway on 2018/4/5.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGWorshipView.h"
@interface MGWorshipView ()

@property (nonatomic, strong) CAShapeLayer *bgLayer;

@property (nonatomic, strong) CAShapeLayer *subLayer;

@property (nonatomic, strong) CAShapeLayer *subLayer2;

@end
@implementation MGWorshipView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.bgLayer = [[CAShapeLayer alloc] init];
        
        _bgLayer.frame = self.bounds;
        
        [self.layer addSublayer:_bgLayer];
        
    }
    return self;
}

- (void)showAnimationView
{
    self.subLayer =  [self setupSubLayerWithStartAngle:-M_PI_4 * 1.2 endAngle:M_PI_4 * 1.2];
    
    self.subLayer2 =  [self setupSubLayerWithStartAngle:M_PI_4 * 0.8 + M_PI_2 endAngle:M_PI_4 * 1.2 + M_PI];
    
    [self performSelector:@selector(addAnimation) withObject:self afterDelay:1];
    
    [self performSelector:@selector(addAnimation2) withObject:self afterDelay:1.5];
}

- (CAShapeLayer *)setupSubLayerWithStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(self.width * 0.5 , self.width * 0.5 ) radius:25 startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    
    layer.frame = self.bounds;
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    layer.strokeColor = kBgColor.CGColor;
    
    layer.lineWidth = 5;
    
    layer.lineCap = kCALineJoinRound;
    
    layer.path = path.CGPath;
    
    layer.strokeEnd = 0.0;
    
    [_bgLayer addSublayer:layer];
    
    return layer;
}

- (void)addAnimation
{
    [CATransaction begin];
    
    [CATransaction setDisableActions:NO]; // 关闭animation动画效果，开启隐式动画
    
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [CATransaction setAnimationDuration:0.5];
    
    self.subLayer.strokeEnd = 1;
    
    self.subLayer2.strokeEnd = 1;
    
    [CATransaction commit];
}

- (void)addAnimation2
{
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];

    rotationAnimation.duration = 1.0f;
    
    rotationAnimation.repeatCount = MAXFLOAT;
    
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.bgLayer addAnimation:rotationAnimation forKey:rotationAnimation.keyPath];
}


@end
