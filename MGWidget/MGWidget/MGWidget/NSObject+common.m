//
//  NSObject+common.m
//  MGWidget
//
//  Created by acmeway on 2018/3/29.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "NSObject+common.h"
#import <objc/runtime.h>

@implementation NSObject (common)

- (UIBezierPath *)pathWithEffectType:(MGEffectStyle)type
{
    UIBezierPath *tPath = nil;
    switch (type) {
        case MGEffectStyleDrop:
        {
            
        }
            break;
        case MGEffectStyleThimble:
        {
            tPath = [UIBezierPath bezierPath];
            
            [tPath moveToPoint:CGPointMake(kScreenWidth/2.0, 200)];
            
            [tPath addQuadCurveToPoint:CGPointMake(kScreenWidth/2.0, 400) controlPoint:CGPointMake(kScreenWidth/2.0 + 200, 100)];
            
            [tPath addQuadCurveToPoint:CGPointMake(kScreenWidth/2.0, 200) controlPoint:CGPointMake(kScreenWidth/2.0 - 200, 100)];
            
            [tPath closePath];
        }
            break;
        case MGEffectStyleCircle:
            break;
        case MGEffectStyleStrip:
            break;
        case MGEffectStyleShape:
        {
            CGFloat layerY = (kScreenWidth * 1.5 - 45) / 2.0;
            
            tPath = [UIBezierPath bezierPath];
            
            [tPath moveToPoint:CGPointMake(kScreenWidth/2.0, layerY)];
            
            [tPath addQuadCurveToPoint:CGPointMake(kScreenWidth/2.0, layerY + 45) controlPoint:CGPointMake(kScreenWidth/2.0 + 55, layerY - 20)];
            
            [tPath addQuadCurveToPoint:CGPointMake(kScreenWidth/2.0, layerY) controlPoint:CGPointMake(kScreenWidth/2.0 - 55, layerY - 20)];
            
            [tPath closePath];
        }
            break;
        default:
            break;
    }
    return tPath;
}


- (void)addAnimationWithEffectType:(MGEffectStyle)type
{
    CALayer *layer = (CALayer *)self;
    
    switch (type) {
        case MGEffectStyleDrop:
        {
            
        }
            break;
        case MGEffectStyleThimble:
        {
            
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            
            animation.path = [self pathWithEffectType:type].CGPath;
            
            animation.duration = 6;
            
            animation.repeatCount = MAXFLOAT;
            
            [layer addAnimation:animation forKey:animation.keyPath];
        }
            break;
        case MGEffectStyleCircle:
        {
            CABasicAnimation *circleAnimation = [self animationKeyPath:@"transform.scale"
                                                            from:@(1.0)
                                                              to:@(0.2)
                                                        duration:1
                                                      repeatTime:INFINITY];
            
            [layer addAnimation:circleAnimation forKey:circleAnimation.keyPath];
        }
            break;
        case MGEffectStyleStrip:
        {
            CABasicAnimation *stripAnimation = [self animationKeyPath:@"position.y"
                                                                    to:@(layer.position.y - layer.frame.size.height * 0.7)
                                                              duration:0.7
                                                            isReverses:YES
                                                            repeatTime:INFINITY];

            [layer addAnimation:stripAnimation forKey:stripAnimation.keyPath];
        }
            break;
        case MGEffectStyleShape:
        {
            [self addAnimationWithLayer:layer];
        }
        default:
            break;
    }
}

- (CABasicAnimation *)animationKeyPath:(NSString *)keyPath
                                  from:(NSNumber *)fromValue
                                    to:(NSNumber *)toValue
                              duration:(CFTimeInterval)duration
                            repeatTime:(CGFloat)repeat
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    
    animation.fromValue = fromValue;
    
    animation.toValue = toValue;
    
    animation.duration = duration;
    
    animation.repeatCount = repeat;
    
    animation.removedOnCompletion = NO;
    
    return animation;
}

- (CABasicAnimation *)animationKeyPath:(NSString *)keyPath
                                    to:(NSNumber *)toValue
                              duration:(CFTimeInterval)duration
                            isReverses:(BOOL)isReverses
                            repeatTime:(CGFloat)repeat
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    
    animation.toValue = toValue;
    
    animation.duration = duration;
    
    animation.autoreverses = isReverses;
    
    animation.repeatCount = repeat;
    
    animation.removedOnCompletion = NO;
    
    return animation;
}

- (void)addAnimationWithLayer:(CALayer *)layer
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(10, 10, 1)];
    
    animation.duration = 3;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation1.fromValue = @1;
    
    animation1.toValue = @0;
    
    animation1.duration = 3;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    group.animations = @[animation,animation1];
    
    group.duration = 3;
    
    group.repeatCount = HUGE;
    
    [layer addAnimation:group forKey:nil];
}


@end
