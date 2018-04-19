//
//  MGRotaLoadView.m
//  MGWidget
//
//  Created by acmeway on 2018/4/19.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGRotaLoadView.h"

#define DURATION 2
#define SCALE 1.5
@interface MGRotaLoadView ()

@property (nonatomic, strong) UIView *leftDot;

@property (nonatomic, strong) UIView *middleDot;

@property (nonatomic, strong) UIView *rightDot;

@property (nonatomic, strong) NSMutableArray *colors;

@end
@implementation MGRotaLoadView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.colors = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor]].mutableCopy;
        
        [self addSubview:self.leftDot];
        
        [self addSubview:self.middleDot];
        
        [self addSubview:self.rightDot];
        
    }
    return self;
}

- (void)showAnimationView
{
    [self addAnimationForScale];
}

- (void)addAnimationForScale
{
    CAKeyframeAnimation *animation1 = [self keyframeAnimationWithPath:[self leftDotPath]];

    [self.leftDot.layer addAnimation:animation1 forKey:animation1.keyPath];

    CAKeyframeAnimation *animation2 = [self keyframeAnimationWithPath:[self rightDotPath]];

    [self.rightDot.layer addAnimation:animation2 forKey:animation2.keyPath];

    [self performSelector:@selector(addAnimation) withObject:nil afterDelay:0.2f];
    
}

- (void)addAnimation
{
    [self.leftDot.layer addAnimation:[self animationScale] forKey:@"animationScale"];

    [self.rightDot.layer addAnimation:[self animationScale] forKey:@"animationScale"];

    [self.middleDot.layer addAnimation:[self animationScale] forKey:@"animationScale"];
}

- (CABasicAnimation *)animationScale
{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"transform.scale"];

    animation.fromValue           = [NSNumber numberWithFloat:1];

    animation.toValue             = [NSNumber numberWithFloat:SCALE];

    animation.repeatCount         = INFINITY;

    animation.autoreverses        = YES;

    animation.duration            = DURATION / 2.0;

    animation.removedOnCompletion = NO;

    animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    return animation;
}

- (CAKeyframeAnimation *)keyframeAnimationWithPath:(UIBezierPath *)path
{
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation1.path                 = path.CGPath;
    
    animation1.repeatCount          = CGFLOAT_MAX;
    
    animation1.duration             = DURATION;
    
    animation1.timingFunction       = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    return animation1;
}

- (UIBezierPath *)leftDotPath
{
    CGFloat r            = self.leftDot.width * SCALE;

    CGFloat R            = (fabs(self.leftDot.centerX - self.middleDot.centerX) + r) / 2.0;

    UIBezierPath *path1  = [UIBezierPath bezierPath];

    [path1 moveToPoint:_leftDot.center];

    [path1 addArcWithCenter:CGPointMake(self.centerX - R + r, self.centerY) radius:R startAngle:-M_PI endAngle:0 clockwise:NO];

    UIBezierPath *path11 = [UIBezierPath bezierPath];

    [path11 addArcWithCenter:self.center radius:r startAngle:0 endAngle:-M_PI clockwise:NO];

    [path1 appendPath:path11];

    [path1 addLineToPoint:self.leftDot.center];

    return path1;
}

- (UIBezierPath *)rightDotPath
{
    CGFloat r            = self.rightDot.width * SCALE;

    CGFloat R            = (fabs(self.rightDot.centerX - self.middleDot.centerX) + r) / 2.0;

    UIBezierPath *path1  = [UIBezierPath bezierPath];

    [path1 moveToPoint:_rightDot.center];

    [path1 addArcWithCenter:CGPointMake(self.centerX + R - r, self.centerY) radius:R startAngle:0 endAngle:-M_PI clockwise:NO];

    UIBezierPath *path11 = [UIBezierPath bezierPath];

    [path11 addArcWithCenter:self.center radius:r startAngle:-M_PI endAngle:0 clockwise:NO];

    [path1 appendPath:path11];

    [path1 addLineToPoint:self.rightDot.center];

    return path1;
}


- (UIView *)leftDot
{
    if (!_leftDot) {
        _leftDot                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _leftDot.centerY             = self.centerY;
        
        _leftDot.centerX             = self.centerX - 30;
        
        _leftDot.layer.cornerRadius  = 5;
        
        _leftDot.layer.masksToBounds = YES;
        
        _leftDot.backgroundColor     = self.colors[0];
    }
    return _leftDot;
}

- (UIView *)middleDot
{
    if (!_middleDot) {
        _middleDot                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _middleDot.centerY             = self.centerY;
        
        _middleDot.centerX             = self.centerX;
        
        _middleDot.layer.cornerRadius  = 5;
        
        _middleDot.layer.masksToBounds = YES;
        
        _middleDot.backgroundColor     = self.colors[1];
    }
    return _middleDot;
}

- (UIView *)rightDot
{
    if (!_rightDot) {
        _rightDot                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _rightDot.centerY             = self.centerY;
        
        _rightDot.centerX             = self.centerX + 30;
        
        _rightDot.layer.cornerRadius  = 5;
        
        _rightDot.layer.masksToBounds = YES;
        
        _rightDot.backgroundColor     = self.colors[2];
    }
    return _rightDot;
}

@end
