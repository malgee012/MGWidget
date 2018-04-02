//
//  NSObject+common.m
//  MGWidget
//
//  Created by acmeway on 2018/3/29.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "NSObject+common.h"
#import <objc/runtime.h>

static char *kBtnKey = "kBtnKey";

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
            UIView *view = (UIView *)self;
            
            CGFloat layerY = (view.height - 45) / 2.0;
            
            tPath = [UIBezierPath bezierPath];
            
            [tPath moveToPoint:CGPointMake(kScreenWidth/2.0, layerY)];
            
            [tPath addQuadCurveToPoint:CGPointMake(kScreenWidth/2.0, layerY + 45) controlPoint:CGPointMake(kScreenWidth/2.0 + 55, layerY - 20)];
            
            [tPath addQuadCurveToPoint:CGPointMake(kScreenWidth/2.0, layerY) controlPoint:CGPointMake(kScreenWidth/2.0 - 55, layerY - 20)];
            
            [tPath closePath];
        }
            break;
        case MGEffectStyleLinear:
        {
            
        }
            break;
        case MGEffectStyleTriangle:
        {
            CGFloat kTop = 100;
            
            tPath = [UIBezierPath bezierPath];
            
            [tPath moveToPoint:CGPointMake(kScreenWidth/2.0, kTop)];
            
            [tPath addLineToPoint:CGPointMake(kScreenWidth/2.0 + 50, kTop + sqrt(100 * 100 - 50 * 50))];
            
            [tPath addLineToPoint:CGPointMake(kScreenWidth/2.0 - 50, kTop + sqrt(100 * 100 - 50 * 50))];
            
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
        case MGEffectStyleLinear:
        {
            
        }
            break;
        case MGEffectStyleTriangle:
        {
            
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            
            animation.path = [self pathWithEffectType:type].CGPath;
            
            animation.duration = 3;
            
            animation.repeatCount = MAXFLOAT;
            
            [layer addAnimation:animation forKey:animation.keyPath];
            
        }
            break;
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

- (void)setupLineBtnShowStatus:(BOOL)status btnArray:(NSArray *)btnArray
{
    if (status)
    {
        for (int i = 0; i < btnArray.count; i++) {
            
            UIButton *btn = btnArray[i];
            
            [self setBtn:btn];
            
            [self addAnimationForShowBtn:btn];
        }
    }
    else
    {
        for (int i = (int)btnArray.count - 1; i >= 0; i--) {
        
            UIButton *btn = btnArray[i];
            
            [self setBtn:btn];
            
            [self addAnimationForHideBtn:btn];
        }
    }
}

- (NSArray <UIButton *>*)btnArray
{
    NSArray *btnArray = objc_getAssociatedObject(self, _cmd);
    
    return btnArray;
}

- (void)setBtnArray:(NSArray <UIButton *>*)btnArray
{
    objc_setAssociatedObject(self, _cmd, btnArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)btn
{
    UIButton *btn = objc_getAssociatedObject(self, &kBtnKey);
    
    return btn;
}

- (void)setBtn:(UIButton *)btn
{
    objc_setAssociatedObject(self, &kBtnKey, btn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addAnimationForShowBtn:(UIButton *)btn
{
//    btn.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    
    CGFloat kTopMargin = 115;
    
    CGPoint startPoint = CGPointMake(35, 35);
    
    CGPoint endPoint = CGPointMake(35, kTopMargin + 80 *  (self.btnArray.count - btn.tag - 1));
    
    
    DLog(@">>>>> %@", NSStringFromCGPoint(endPoint));
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    positionAnimation.duration=.3;
    
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    positionAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
    
    positionAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
    
    positionAnimation.beginTime = CACurrentMediaTime() + (0.3/self.btnArray.count * btn.tag);

    positionAnimation.fillMode = kCAFillModeForwards;
    
    positionAnimation.removedOnCompletion = NO;

    [btn.layer addAnimation:positionAnimation forKey:@"positionAnimation"];

    

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    scaleAnimation.duration=.3;
    
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    scaleAnimation.fromValue = @(0);
    
    scaleAnimation.toValue = @(1);
    
    scaleAnimation.beginTime = CACurrentMediaTime() + (0.3/self.btnArray.count * btn.tag);

    scaleAnimation.fillMode = kCAFillModeForwards;
    
    scaleAnimation.removedOnCompletion = NO;

    scaleAnimation.delegate = self;
    
    [scaleAnimation setValue:@"showAnimation" forKey:@"animation"];
    
    [btn.layer addAnimation:scaleAnimation forKey:@"transformscale"];
    
    btn.transform = CGAffineTransformMakeScale(1.f, 1.0f);
    
    btn.layer.position = endPoint;
}



- (void)addAnimationForHideBtn:(UIButton *)btn
{
  
    
    CGPoint startPoint = CGPointFromString([NSString stringWithFormat:@"%@",[btn.layer valueForKeyPath:@"position"]]);
    
    DLog(@" %@      >> %ld",  NSStringFromCGPoint(startPoint), btn.tag);
    
    CGPoint endPoint = CGPointMake(35, 35);
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    positionAnimation.duration=.3;
    
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    positionAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
    
    positionAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
    
    positionAnimation.beginTime = CACurrentMediaTime() + (0.3/(self.btnArray.count * (self.btnArray.count - btn.tag - 1)));
    
    positionAnimation.fillMode = kCAFillModeForwards;
    
    positionAnimation.removedOnCompletion = NO;

    [btn.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    btn.layer.position = endPoint;
    

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    scaleAnimation.duration=.3;
    
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    scaleAnimation.fromValue = @(1);
    
    scaleAnimation.toValue = @(0);
    
    scaleAnimation.beginTime = CACurrentMediaTime() + (0.3/(self.btnArray.count * (self.btnArray.count - btn.tag - 1)));
    
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    scaleAnimation.removedOnCompletion = NO;

    scaleAnimation.delegate = self;
    
    [scaleAnimation setValue:@"hideAnimation" forKey:@"animation"];
    
    [btn.layer addAnimation:scaleAnimation forKey:@"transformscale"];

    self.btn.transform = CGAffineTransformMakeScale(1.f, 1.f);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    if (flag) {
        CABasicAnimation * animation = (CABasicAnimation *)anim;
        if ([[anim valueForKey:@"animation"] isEqualToString:@"showAnimation"])
        {
//            self.btn.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
            
        }
        else if ([[animation valueForKey:@"animation"] isEqualToString:@"hideAnimation"])
        {
            self.btn.transform = CGAffineTransformMakeScale(1.f, 1.f);
            
        }
    }
}

@end
