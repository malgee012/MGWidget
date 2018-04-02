//
//  MGLoaderView.m
//  MGWidget
//
//  Created by acmeway on 2018/3/30.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGLoaderView.h"
@interface MGLoaderView ()

@property (strong, nonatomic) CAShapeLayer *indicatorLayer;

@end
@implementation MGLoaderView

+ (instancetype)loader
{
    MGLoaderView *loader = [[MGLoaderView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    return loader;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
        
        [self.layer addSublayer:self.indicatorLayer];
    }
    return self;
}

- (void)setStyle:(MGLoaderStyle)style
{
    switch (style) {
        case MGLoaderStyleTriangle:
            {
                self.indicatorLayer.frame = CGRectMake(self.width / 2.0, 0, 8, 8);
                
                self.indicatorLayer.cornerRadius = 4;
                
                
                
                
                
            }
            break;
            
        default:
            break;
    }
}

- (CAShapeLayer *)indicatorLayer
{
    if (!_indicatorLayer) {
        
        _indicatorLayer = [CAShapeLayer layer];
        
        _indicatorLayer.contentsScale = [[UIScreen mainScreen] scale];
    }
    return _indicatorLayer;
}

@end
