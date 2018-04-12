//
//  MGLoadDotView.m
//  MGWidget
//
//  Created by acmeway on 2018/4/4.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGLoadDotView.h"
@interface MGLoadDotView ()

@property (nonatomic, strong) UIView *dotView1;

@property (nonatomic, strong) UIView *dotView2;

@property (nonatomic, strong) UIView *dotView3;
@end
@implementation MGLoadDotView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.dotView1];
        
        [self addSubview:self.dotView2];

        [self addSubview:self.dotView3];
        
    }
    return self;
}

- (void)showAnimationView
{
    CGFloat duration                = 1.2;

    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    animation1.path                 = [self pathTrace1].CGPath;

    animation1.duration             = duration;

    animation1.repeatCount          = MAXFLOAT;

    animation1.timingFunction       = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [_dotView1.layer addAnimation:animation1 forKey:animation1.keyPath];

    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    animation2.path                 = [self pathTrace2].CGPath;

    animation2.duration             = duration;

    animation2.repeatCount          = MAXFLOAT;

    animation2.timingFunction       = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [_dotView2.layer addAnimation:animation2 forKey:animation2.keyPath];

    CAKeyframeAnimation *animation3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    animation3.path                 = [self pathTrace3].CGPath;

    animation3.duration             = duration;

    animation3.repeatCount          = MAXFLOAT;

    animation3.timingFunction       = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [_dotView3.layer addAnimation:animation3 forKey:animation3.keyPath];
}

- (void)hideAnimationView
{
    [_dotView1 removeFromSuperview];
    
    [_dotView2 removeFromSuperview];
    
    [_dotView3 removeFromSuperview];
    
}

- (UIBezierPath *)pathTrace1
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.centerX - 10, self.centerY)
                                                        radius:10
                                                    startAngle:M_PI
                                                      endAngle:0
                                                     clockwise:YES];
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.centerX + 10, self.centerY)
                                                         radius:10
                                                     startAngle:-M_PI
                                                       endAngle:0
                                                      clockwise:NO];
    [path appendPath:path1];
    
    return path;
}

- (UIBezierPath *)pathTrace2
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.centerX - 10, self.centerY)
                                                        radius:10
                                                    startAngle:0
                                                      endAngle:M_PI
                                                     clockwise:YES];
    return path;
}

- (UIBezierPath *)pathTrace3
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.centerX + 10, self.centerY)
                                                        radius:10
                                                    startAngle:0
                                                      endAngle:M_PI
                                                     clockwise:NO];
    return path;
}

- (UIView *)dotView1
{
    if (!_dotView1) {
        _dotView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _dotView1.centerY = self.centerY;
        
        _dotView1.centerX = self.centerX - 20;
        
        _dotView1.layer.cornerRadius = 5;
        
        _dotView1.layer.masksToBounds = YES;
        
        _dotView1.backgroundColor = kBgColor;
    }
    return _dotView1;
}

- (UIView *)dotView2
{
    if (!_dotView2) {
        _dotView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _dotView2.centerY = self.centerY;
        
        _dotView2.centerX = self.centerX;
        
        _dotView2.layer.cornerRadius = 5;
        
        _dotView2.layer.masksToBounds = YES;
        
        _dotView2.backgroundColor = kBgColor;
    }
    return _dotView2;
}

- (UIView *)dotView3
{
    if (!_dotView3) {
        _dotView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _dotView3.centerY = self.centerY;
        
        _dotView3.centerX = self.centerX + 20;
        
        _dotView3.layer.cornerRadius = 5;
        
        _dotView3.layer.masksToBounds = YES;
        
        _dotView3.backgroundColor = kBgColor;
    }
    return _dotView3;
}

@end
