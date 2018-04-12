//
//  MGChainView.m
//  MGWidget
//
//  Created by maling  on 2018/4/11.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGChainView.h"
#define kRadians(x)  (M_PI * (x) / 180.0)
@interface MGChainView ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) CAShapeLayer *chainLayer;

@end
@implementation MGChainView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor brownColor];
        
        [self addSubview:self.bgView];
    }
    return self;
}

- (void)showAnimationView
{
    CGFloat startAngle = -M_PI_2;
    
    UIBezierPath *path = [self setupSubLayerWithStartAngle:startAngle
                                                  endAngle:startAngle + kRadians(360)];
    
    [self.chainLayer addAnimation:[self addAniamtion:path.CGPath durTimes:2 repeatTimes:MAXFLOAT]
                           forKey:@"groupAnimation1"] ;
}

- (CABasicAnimation *)addAniamtion:(CGPathRef)path durTimes:(CGFloat)time repeatTimes:(CGFloat)repeatTimes
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    animation.fromValue = [NSNumber numberWithFloat:0];
    
    animation.toValue = [NSNumber numberWithFloat:1.0];
    
    animation.repeatCount = repeatTimes;
    
    animation.autoreverses = YES;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    animation.duration = time;
    
    CABasicAnimation* rotationAnimation;
    
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2 ];
    
    rotationAnimation.duration = 1.0;
    
    rotationAnimation.repeatCount = repeatTimes;
    
    [self.bgView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    return animation;
}

- (UIBezierPath *)setupSubLayerWithStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(self.width * 0.5 , self.width * 0.5 ) radius:self.width * 0.25 startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    
    layer.frame = self.bounds;
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    layer.strokeColor = kBgColor.CGColor;
    
    layer.lineWidth = 5;
    
    layer.lineCap = kCALineJoinRound;
    
    layer.path = path.CGPath;
    
    self.chainLayer = layer;
    
    [self.bgView.layer addSublayer:layer];
    
    return path;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
    }
    return _bgView;
}

@end
