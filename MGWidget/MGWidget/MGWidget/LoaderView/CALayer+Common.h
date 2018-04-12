//
//  CALayer+Common.h
//  MGWidget
//
//  Created by acmeway on 2018/4/12.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>


@interface CALayer (Common)<CAAnimationDelegate>

- (CABasicAnimation *)animationKeyPath:(NSString *)keyPath
                              position:(CGPoint)position
                               duration:(CFTimeInterval)duration
                                    key:(NSString *)key
                             isReverses:(BOOL)isReverses
                             repeatTime:(CGFloat)repeat;

@end
