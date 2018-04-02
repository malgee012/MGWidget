//
//  MGShowView.m
//  MGWidget
//
//  Created by acmeway on 2018/3/29.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGShowView.h"
#import "MGPatternView.h"
@interface MGShowView ()

@property (nonatomic, strong) NSMutableArray *btnArray;

@property (strong, nonatomic) CAShapeLayer *indicatorLayer;

@property (strong, nonatomic) CAReplicatorLayer *replicatorLayer;

@end

@implementation MGShowView

+ (instancetype)showWithType:(MGEffectStyle)type
{
    MGShowView *show = [[self alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    show.type = type;
    
    show.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.2];
    
    
    return show;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.layer addSublayer:self.replicatorLayer];
        
        [self.replicatorLayer addSublayer:self.indicatorLayer];
        
        
        CALayer *line = [[CALayer alloc] init];
        
        line.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
        
        line.frame = CGRectMake((kScreenWidth - 0.5) * 0.5, 0, 0.5, kScreenHeight);
        
        [self.layer addSublayer:line];
        
        CALayer *line2 = [[CALayer alloc] init];
        
        line2.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
        
        line2.frame = CGRectMake(0, (self.height - 0.5) * 0.5, kScreenWidth, 0.5);
        
        
        [self.layer addSublayer:line2];
        
    }
    return self;
}

- (void)setType:(MGEffectStyle)type
{
    
    switch (type) {
        case MGEffectStyleDrop:
        {
            
            
            

        }
            break;
        case MGEffectStyleThimble:
        {
            
            _indicatorLayer.frame = CGRectMake((kScreenWidth - 10) * 0.5, 200, 10, 10);
            
            _indicatorLayer.cornerRadius = 5;
            
            _indicatorLayer.backgroundColor = MGColor.CGColor;
            
            
            _replicatorLayer.instanceCount = 30;
            
            _replicatorLayer.instanceDelay = 6.0 / 30;
            
            _replicatorLayer.instanceColor = MGColor.CGColor;
            
            _replicatorLayer.instanceGreenOffset = -0.03;
            
            _replicatorLayer.instanceRedOffset = -0.02;
            
            _replicatorLayer.instanceBlueOffset = -0.01;
            
        }
            break;
        case MGEffectStyleCircle:
        {
            _indicatorLayer.frame = CGRectMake(kScreenWidth/2.0, 200, 10, 10);
            
            _indicatorLayer.cornerRadius = 5;
            
            _indicatorLayer.transform = CATransform3DMakeScale(0.2, 0.2, 0.2);
            
            _indicatorLayer.backgroundColor = MGColor.CGColor;
            
            
            _replicatorLayer.instanceCount = 12;
            
            _replicatorLayer.instanceDelay = 1.0 / 12;
            
            CGFloat angle = (2 * M_PI)/self.replicatorLayer.instanceCount;
            
            _replicatorLayer.instanceColor = MGColor.CGColor;
            
            _replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 0.1);
            
            _replicatorLayer.instanceBlueOffset = -0.01;
            
            _replicatorLayer.instanceGreenOffset = -0.01;
            
        }
            break;
        case MGEffectStyleStrip:
        {
            _indicatorLayer.frame = CGRectMake(0, 0, 30, self.height * 0.8);
            
            _indicatorLayer.backgroundColor = MGColor.CGColor;
            
            _indicatorLayer.anchorPoint = CGPointMake(0, 0);

            _indicatorLayer.position = CGPointMake(self.x + 10, self.y + self.height * 0.8);
            
            _indicatorLayer.cornerRadius = 3;
            
            
            _replicatorLayer.instanceCount = 9;

            _replicatorLayer.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);

            _replicatorLayer.instanceDelay = 0.3;

            _replicatorLayer.masksToBounds = YES;

        }
            break;
        case MGEffectStyleShape:
        {
            _indicatorLayer.frame = self.bounds;
            
            _indicatorLayer.path = [self pathWithEffectType:type].CGPath;
            
            _indicatorLayer.fillColor = [UIColor redColor].CGColor;
            
            
            _replicatorLayer.instanceCount = 5;

            _replicatorLayer.instanceDelay = 3.0 / 5;

            _replicatorLayer.instanceColor = [UIColor redColor].CGColor;
            
            
        }
            break;
        case MGEffectStyleLinear:
        {
            
            MGPatternView *patterView = [[MGPatternView alloc] initWithFrame:CGRectMake(10,kNavigationStatusHeiht + 10, 50, 50)];
            
            patterView.motorDirection = MGMotorDirectionRight;
            
            patterView.subViews = [self subViews];
            
            [patterView setPatterviewBlock:^(NSInteger index) {
                
                UIButton *btn = [self subViews][index];
                
                DLog(@">>> %@", btn.titleLabel.text);
                
            }];
            
            [self addSubview:patterView];
            
            MGPatternView *patterView3 = [[MGPatternView alloc] initWithFrame:CGRectMake(kScreenWidth - 60, self.height - 60, 50, 50)];
            
            patterView3.motorDirection = MGMotorDirectionUp;
            
            patterView3.subViews = [self subViews];
            
            patterView3.viewSpacing = 50;
            
            [patterView3 setPatterviewBlock:^(NSInteger index) {
                
                UIButton *btn = [self subViews][index];
                
                DLog(@">>> %@", btn.titleLabel.text);
                
            }];
            
            [self addSubview:patterView3];
        
        }
            break;
        case MGEffectStyleTriangle:
        {
            _indicatorLayer.frame = CGRectMake((self.width - 8) / 2.0, 100, 8, 8);
            
            _indicatorLayer.cornerRadius = 4;
            
            _indicatorLayer.backgroundColor = MGColor.CGColor;
            
            _replicatorLayer.instanceCount = 3;
            
            _replicatorLayer.instanceDelay = 1;
            
            _replicatorLayer.instanceColor = MGColor.CGColor;
            
        }
            break;
        default:
            break;
    }
    
    [_indicatorLayer addAnimationWithEffectType:type];
}

- (NSArray <UIButton *>*)subViews
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSInteger tag = 0;
    for (NSString *title in @[@"唐", @"宋", @"元", @"明", @"清"]) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [button setTitle:title forState:UIControlStateNormal];
        
        button.frame = CGRectMake(0, 0, 40, 40);
        
        button.layer.cornerRadius = button.height / 2.0f;
        
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        
        button.clipsToBounds = YES;
        
        button.tag = tag++;
        
        [array addObject:button];
    }
    
    return array.copy;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.replicatorLayer.frame = self.bounds;
}

- (CAShapeLayer *)indicatorLayer
{
    if (!_indicatorLayer) {
        
        _indicatorLayer = [CAShapeLayer layer];
        
        _indicatorLayer.contentsScale = [[UIScreen mainScreen] scale];
    }
    return _indicatorLayer;
}

- (CAReplicatorLayer *)replicatorLayer
{
    if (!_replicatorLayer) {
        
        _replicatorLayer = [CAReplicatorLayer layer];
        
        _replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
        
        _replicatorLayer.shouldRasterize = YES;
        
        _replicatorLayer.rasterizationScale = [[UIScreen mainScreen] scale];
    }
    return _replicatorLayer;
}

- (NSMutableArray *)btnArray
{
    if (!_btnArray) {
        _btnArray = [[NSMutableArray alloc] init];
    }
    return _btnArray;
}

@end
