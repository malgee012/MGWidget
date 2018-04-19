//
//  NSObject+LoadTool.h
//  MGWidget
//
//  Created by acmeway on 2018/4/3.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LoadTool)

typedef NS_ENUM(NSInteger, MGLoaderStyle) {
    
    MGLoaderStyleTriangle,
    MGLoaderStyleCationDot,
    MGLoaderStyleExpandDot,
    MGLoaderStyleShipDot,
    MGLoaderStyleChain,
    MGLoaderStyleAlter,
    MGLoaderStyleAlternation,
    MGLoaderStyleRotaDot
    
};

//@property (nonatomic, assign) CGFloat _kViewWidth;

- (void)addAnimationWithLoaderStyle:(MGLoaderStyle)style;

@end
