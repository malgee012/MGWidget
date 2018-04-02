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
    MGEffectStyleShape,
    MGEffectStyleLinear, 
    MGEffectStyleTriangle
};

typedef NS_ENUM(NSInteger, MGLoaderStyle) {
    
    MGLoaderStyleTriangle
};

@interface NSObject (common)<CAAnimationDelegate>

- (UIBezierPath *)pathWithEffectType:(MGEffectStyle)type;

- (void)addAnimationWithEffectType:(MGEffectStyle)type;

- (void)setupLineBtnShowStatus:(BOOL)status btnArray:(NSArray *)btnArray;

@end
