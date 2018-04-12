//
//  CALayer+Common.m
//  MGWidget
//
//  Created by acmeway on 2018/4/12.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "CALayer+Common.h"

@implementation CALayer (Common)

- (CABasicAnimation *)animationKeyPath:(NSString *)keyPath
                              position:(CGPoint)position
                              duration:(CFTimeInterval)duration
                                   key:(NSString *)key
                            isReverses:(BOOL)isReverses
                            repeatTime:(CGFloat)repeat;
{
    
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:keyPath];
    
    animation.toValue             = @(position.x);
    
    animation.duration            = duration;
    
    animation.autoreverses        = isReverses;
    
    animation.repeatCount         = repeat;
    
    animation.delegate            = self;
    
    [animation setValue:key forKey:@"animatioin"];
    
    animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode            = kCAFillModeForwards;
    
    
    return animation;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if ([[anim valueForKey:@"animatioin"] isEqualToString:@"animation1"]) {
        
        DLog(@"动画结束了1");
        
        
        
        
    }
    else if ([[anim valueForKey:@"animatioin"] isEqualToString:@"animation2"])
    {
        DLog(@"动画结束了2");
    }
}
@end
