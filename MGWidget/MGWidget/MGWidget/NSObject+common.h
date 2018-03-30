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
    MGEffectStyleShape
    
};

@interface NSObject (common)

- (UIBezierPath *)pathWithEffectType:(MGEffectStyle)type;

- (void)addAnimationWithEffectType:(MGEffectStyle)type;

@end
