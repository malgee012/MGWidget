//
//  NSObject+common.h
//  MGWidget
//
//  Created by acmeway on 2018/3/29.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MGEffectStyle) {
    
    MGEffectStyleDrop,
    MGEffectStyleThimble,
    MGEffectStyleCircle,
    MGEffectStyleStrip,
    MGEffectStyleWoody,
    MGEffectStyleShape,
    MGEffectStyleLinear,
    MGEffectStyleInverted,
};


@interface NSObject (common)<CAAnimationDelegate>

- (UIBezierPath *)pathWithEffectType:(MGEffectStyle)type;

- (void)addAnimationWithEffectType:(MGEffectStyle)type;

//- (CABasicAnimation *)animationKeyPath:(NSString *)keyPath
//                                  from:(NSNumber *)fromValue
//                                    to:(NSNumber *)toValue
//                              duration:(CFTimeInterval)duration
//                            repeatTime:(CGFloat)repeat;

- (CABasicAnimation *)animationKeyPath:(NSString *)keyPath
                                    to:(NSNumber *)toValue
                              duration:(CFTimeInterval)duration
                            isReverses:(BOOL)isReverses
                            repeatTime:(CGFloat)repeat;

@end
