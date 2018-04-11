//
//  MGChainView.m
//  MGWidget
//
//  Created by maling  on 2018/4/11.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGChainView.h"

@interface MGChainView ()<CAAnimationDelegate>

@property (nonatomic, strong) CAShapeLayer *chainLayer;

@end
@implementation MGChainView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor brownColor];
    }
    return self;
}

- (void)showAnimationView
{
    UIBezierPath *path = [self setupSubLayerWithStartAngle:-M_PI_2 endAngle:M_PI];
    
    [self.chainLayer addAnimation:[self keyframeAniamtion:path.CGPath durTimes:1 Rep:MAXFLOAT]
                           forKey:@"animation1"] ;
    
    
}

- (CABasicAnimation *)keyframeAniamtion:(CGPathRef)path durTimes:(float)time Rep:(float)repeatTimes
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    
    animation.delegate = self;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    
    [self.chainLayer setValue:animation forKey:@"ani"];
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    animation.autoreverses=NO;
    animation.duration=time;
//    animation.repeatCount=repeatTimes;
    
    return animation;
}

- (CABasicAnimation *)keyframeAniamtion2:(CGPathRef)path durTimes:(float)time Rep:(float)repeatTimes
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:0.5];
    
//    animation.delegate = self;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //    animation.autoreverses=NO;
    animation.duration=time;
    //    animation.repeatCount=repeatTimes;
    
    return animation;
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    UIBezierPath *path = [self setupSubLayerWithStartAngle:-M_PI_2 endAngle:M_PI];
    
    
        
        [self.chainLayer addAnimation:[self keyframeAniamtion2:path.CGPath durTimes:1 Rep:MAXFLOAT]
                               forKey:@"aniww"];
    
}

- (UIBezierPath *)setupSubLayerWithStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle
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
    
//    layer.strokeEnd = 1.0;
    
    self.chainLayer = layer;
    
    [self.layer addSublayer:layer];
    
    return path;
}

@end
