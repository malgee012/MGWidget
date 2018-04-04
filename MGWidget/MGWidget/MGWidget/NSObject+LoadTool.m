//
//  NSObject+LoadTool.m
//  MGWidget
//
//  Created by acmeway on 2018/4/3.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "NSObject+LoadTool.h"
#import <objc/runtime.h>

static char *kViewWidthKey = "kViewWidthKey";
@implementation NSObject (LoadTool)

- (UIBezierPath *)pathWithLoaderStyle:(MGLoaderStyle)style
{
    UIBezierPath *tPath = nil;
    
    switch (style) {
        case MGLoaderStyleTriangle:
        {
            CGFloat kTop = self.kViewWidth * 0.2;
            
            CGFloat kHeight = self.kViewWidth * 0.6;
            
            tPath = [UIBezierPath bezierPath];
            
            [tPath moveToPoint:CGPointMake(self.kViewWidth/2.0, kTop)];

            [tPath addLineToPoint:CGPointMake(self.kViewWidth/2.0 + sqrt(kHeight * kHeight / 3.0), kTop + kHeight)];

            [tPath addLineToPoint:CGPointMake(self.kViewWidth/2.0 - sqrt(kHeight * kHeight / 3.0), kTop + kHeight)];

            [tPath closePath];
        }
            break;
        default:
            break;
    }
    
    return tPath;
}

- (void)setKViewWidth:(CGFloat)kViewWidth
{
    objc_setAssociatedObject(self, &kViewWidthKey, @(kViewWidth), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)kViewWidth
{
    return [objc_getAssociatedObject(self, &kViewWidthKey) floatValue];
}

- (void)addAnimationWithLoaderStyle:(MGLoaderStyle)style
{
    CALayer *layer = (CALayer *)self;
    
    [self setKViewWidth:layer.superlayer.superlayer.frame.size.width];
    
    switch (style) {
        case MGLoaderStyleTriangle:
        {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            
            animation.path = [self pathWithLoaderStyle:style].CGPath;
            
            animation.duration = 2;
            
            animation.repeatCount = MAXFLOAT;
            
            [layer addAnimation:animation forKey:animation.keyPath];
        }
            break;
        case MGLoaderStyleCationDot:
        {
            
        }
            break;
        case MGLoaderStyleExpandDot:
        {
            CABasicAnimation *animation = [self animationKeyPath:@"transform.scale"
                                                              to:@(1.5)
                                                        duration:0.5
                                                      isReverses:YES
                                                      repeatTime:INFINITY];
                        
            [layer addAnimation:animation forKey:animation.keyPath];
            
        }
            break;
        default:
            break;
    }
}



@end
