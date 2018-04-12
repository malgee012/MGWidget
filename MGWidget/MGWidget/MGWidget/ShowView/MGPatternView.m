//
//  MGPatternView.m
//  MGWidget
//
//  Created by acmeway on 2018/4/1.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGPatternView.h"

@interface MGPatternView ()<CAAnimationDelegate>
{
    BOOL _isClick;
    NSInteger _frequency;
}
@property (nonatomic, weak) UIButton  *plusBtn;

@end
@implementation MGPatternView

- (void)setSubViews:(NSArray<UIButton *> *)subViews
{
    _subViews = subViews;
    
    for (UIButton *btn in self.subViews) {

        if (btn != nil)
        {
            [self addSubview:btn];

            btn.centerX = self.width / 2.0;

            btn.centerY = self.height / 2.0;

            btn.hidden  = YES;

            [self sendSubviewToBack:btn];
        }
        
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)clickBtn:(UIButton *)btn
{
    if (self.PatterviewBlock) {
        
        self.PatterviewBlock(btn.tag);
    }
    if (_isClick) [self hidePattern];
    
    self.plusBtn.selected = NO;
}

- (void)setMotorDirection:(MGMotorDirection)motorDirection
{
    _motorDirection = motorDirection;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.viewSpacing = 20;
        
        self.animationDuration = 0.5;
        
        _isClick = YES;
        
        [self setupPlusLinearBtns];
    }
    return self;
}

- (void)setupPlusLinearBtns
{
    UIButton *plusBtn          = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];

    self.plusBtn               = plusBtn;

    [plusBtn setBackgroundImage:[UIImage imageNamed:@"plus_circle"] forState:UIControlStateNormal];

    [plusBtn addTarget:self action:@selector(clickPlusBtn:) forControlEvents:UIControlEventTouchUpInside];

    plusBtn.backgroundColor    = MGColor;

    plusBtn.layer.cornerRadius = 25;

    plusBtn.layer.masksToBounds = YES;
    
    [self addSubview:plusBtn];
}

- (void)clickPlusBtn:(UIButton *)btn
{
    if (_isClick )
    {
        CGFloat minvalue = kMinValue(self.width, self.height);
        
        CGFloat maxValue = kMaxValue(self.width, self.height);
        
        if (minvalue == maxValue)
        {
            [self showPattern];
        }
        else
        {
            [self hidePattern];
        }
    }
}

- (void)showPattern
{
    if (self.subViews.count == 0) return;
    
    CGPoint fromPosition = CGPointZero;

    CGPoint toPosition = CGPointZero;

    [CATransaction begin];
    
    [CATransaction setAnimationDuration:_animationDuration];
    
    [CATransaction setCompletionBlock:^{
        
        for (UIButton *btn in self.subViews) {
            
            btn.transform = CGAffineTransformIdentity;
            
        }
        self.userInteractionEnabled = YES;
    }];
    
    switch (self.motorDirection) {
       
        case MGMotorDirectionLeft:
        {
            self.plusBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
            
            for (UIButton *btn in self.subViews) {
                
                self.width += (_viewSpacing + btn.width);
                
                self.x -= (_viewSpacing + btn.width);
            }
            
            int i = 0;
            for (UIButton * btn in self.subViews) {
                
                btn.hidden = NO;
                
                fromPosition = CGPointMake(self.width - self.height * 0.5, self.height * 0.5);
                
                toPosition = CGPointMake(btn.width * 0.5 + (_viewSpacing + btn.width) * i, self.height * 0.5);
                
                [self addAinmationWithView:btn fromValue:fromPosition toValue:toPosition duration:_animationDuration index:i];
                
                btn.backgroundColor = [UIColor redColor];
                
                i++;
            }
        }
            break;
        case MGMotorDirectionRight:
        {
            for (UIButton *btn in self.subViews) {
                self.width += (_viewSpacing + btn.width) ;
            }
            
            int i = 0;
            for (UIButton * btn in self.subViews) {

                btn.hidden          = NO;

                fromPosition        = CGPointMake(self.height * 0.5, self.height * 0.5);

                toPosition          = CGPointMake(self.height  + (_viewSpacing + btn.width) * (self.subViews.count - i) - btn.width/2.0,
                                         self.height * 0.5);

                [self addAinmationWithView:btn fromValue:fromPosition toValue:toPosition duration:_animationDuration index:i];

                btn.backgroundColor = [UIColor redColor];

                i++;
            }
        }
            break;
        case MGMotorDirectionUp:
        {
            self.plusBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
            
            for (UIButton *btn in self.subViews) {
                
                self.height += (_viewSpacing + btn.height);
                
                self.y -= (_viewSpacing + btn.height);
            }
            
            int i = 0;
            for (UIButton * btn in self.subViews) {
                
                btn.hidden = NO;
                
                fromPosition = CGPointMake(self.width * 0.5, self.height - self.width * 0.5);
                
                toPosition = CGPointMake(self.width * 0.5, btn.height / 2.0 + (_viewSpacing + btn.height) * i );
                
                [self addAinmationWithView:btn fromValue:fromPosition toValue:toPosition duration:_animationDuration index:i];
                
                btn.backgroundColor = [UIColor redColor];
                
                i++;
            }
        }
            break;
        case MGMotorDirectionDown:
        {
            for (UIButton *btn in self.subViews) {
                self.height += (_viewSpacing + btn.height) ;
            }
            
            int i = 0;
            for (UIButton * btn in self.subViews) {
                
                btn.hidden = NO;
                
                fromPosition = CGPointMake(self.width * 0.5, self.width * 0.5);
                
                toPosition = CGPointMake(self.width * 0.5,
                                         self.width  + (_viewSpacing + btn.height) * (self.subViews.count - i) - btn.height/2.0);
                
                [self addAinmationWithView:btn fromValue:fromPosition toValue:toPosition duration:_animationDuration index:i];
                
                btn.backgroundColor = [UIColor redColor];
                
                i++;
            }
        }
            break;
    }
    [CATransaction commit];
}

- (void)hidePattern
{
    [CATransaction begin];
    
    [CATransaction setAnimationDuration:_animationDuration];
    
    [CATransaction setCompletionBlock:^{
        
        for (UIButton *btn in self.subViews) {
            
            btn.transform = CGAffineTransformIdentity;
            
            btn.hidden = YES;
        }

        self.userInteractionEnabled = YES;
    }];
    
     CGFloat kSize = kMinValue(self.width, self.height);
    
    for (NSInteger i = self.subViews.count - 1; i >= 0; i--) {
        
        UIButton *btn = self.subViews[i];
        
        CGPoint fromPosition = CGPointZero;
        
        CGPoint toPosition = CGPointZero;
    
        switch (self.motorDirection) {
           
            case MGMotorDirectionLeft:
            {
                self.width -= (_viewSpacing + btn.width);
                
                self.x += (_viewSpacing + btn.height);
                
                fromPosition = CGPointMake(btn.width / 2.0 - (_viewSpacing + btn.width) * (self.subViews.count - i),
                                           self.height * 0.5);
                
                toPosition = CGPointMake(kSize * 0.5, kSize * 0.5);
                
                [self hideAinmationWithView:btn fromValue:fromPosition toValue:toPosition duration:_animationDuration index:i];
                
            }
                break;
            case MGMotorDirectionRight:
            {
                self.width -= (_viewSpacing + btn.width) ;
                
                fromPosition = CGPointMake(self.height + (_viewSpacing + btn.height) * (self.subViews.count - i) - btn.height / 2.0,
                                           self.height * 0.5);
                toPosition = CGPointMake(kSize * 0.5, kSize * 0.5);
                
                [self hideAinmationWithView:btn fromValue:fromPosition toValue:toPosition duration:_animationDuration index:i];
                
            }
                break;
            case MGMotorDirectionUp:
            {
                self.height -= (_viewSpacing + btn.height);
                
                self.y += (_viewSpacing + btn.height);
                
                fromPosition = CGPointMake(self.width * 0.5,
                                           btn.height / 2.0 - (_viewSpacing + btn.height) * (self.subViews.count - i));
                
                toPosition = CGPointMake(kSize * 0.5, kSize * 0.5);
                
                [self hideAinmationWithView:btn fromValue:fromPosition toValue:toPosition duration:_animationDuration index:i];
                
            }
                break;
            case MGMotorDirectionDown:
            {
                self.height -= (_viewSpacing + btn.height);
                
                fromPosition = CGPointMake(self.width * 0.5,
                                           self.width + (_viewSpacing + btn.height) * (self.subViews.count - i) - btn.height / 2.0);
                
                toPosition = CGPointMake(kSize * 0.5, kSize * 0.5);
                
                [self hideAinmationWithView:btn fromValue:fromPosition toValue:toPosition duration:_animationDuration index:i];
            }
           
                break;
        }
       
        btn.backgroundColor = [UIColor redColor];
    
    }
    
   [CATransaction commit];
}

- (void)addAinmationWithView:(UIView *)view
                   fromValue:(CGPoint)fromeValue
                     toValue:(CGPoint)toValue
                    duration:(CGFloat)animationDuration
                       index:(NSInteger)index
{
    CABasicAnimation *positionAnimation   = [CABasicAnimation animationWithKeyPath:@"position"];

    positionAnimation.duration            = animationDuration;

    positionAnimation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    positionAnimation.fromValue           = [NSValue valueWithCGPoint:fromeValue];

    positionAnimation.toValue             = [NSValue valueWithCGPoint:toValue];

    positionAnimation.beginTime           = CACurrentMediaTime() + (animationDuration * 1.0/self.subViews.count * (index - 1) + 0.03f );

    positionAnimation.fillMode            = kCAFillModeForwards;

    positionAnimation.removedOnCompletion = NO;

    [view.layer addAnimation:positionAnimation forKey:positionAnimation.keyPath];

    view.layer.position                   = toValue;

    view.center                           = toValue;

    CABasicAnimation *scaleAnimation      = [CABasicAnimation animationWithKeyPath:@"transform.scale"];

    scaleAnimation.duration               = animationDuration;

    scaleAnimation.timingFunction         = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    scaleAnimation.fromValue              = [NSNumber numberWithFloat:0.01f];

    scaleAnimation.toValue                = [NSNumber numberWithFloat:1.f];

    scaleAnimation.beginTime              = CACurrentMediaTime() + (animationDuration * 1.0/self.subViews.count * index);

    scaleAnimation.fillMode               = kCAFillModeForwards;

    scaleAnimation.removedOnCompletion    = NO;

    scaleAnimation.delegate               = self;

    [view.layer addAnimation:scaleAnimation forKey:scaleAnimation.keyPath];

    view.transform                        = CGAffineTransformMakeScale(0.01f, 0.01f);

    _isClick                              = NO;

}

- (void)hideAinmationWithView:(UIView *)view
                   fromValue:(CGPoint)fromeValue
                     toValue:(CGPoint)toValue
                    duration:(CGFloat)animationDuration
                       index:(NSInteger)index
{
    CABasicAnimation *positionAnimation   = [CABasicAnimation animationWithKeyPath:@"position"];

    positionAnimation.duration            = animationDuration;

    positionAnimation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    positionAnimation.fromValue           = [NSValue valueWithCGPoint:fromeValue];

    positionAnimation.toValue             = [NSValue valueWithCGPoint:toValue];

    positionAnimation.beginTime           = CACurrentMediaTime() + (animationDuration * 1.0/self.subViews.count * (self.subViews.count - index - 1));

    positionAnimation.fillMode            = kCAFillModeForwards;

    positionAnimation.removedOnCompletion = NO;

    [view.layer addAnimation:positionAnimation forKey:positionAnimation.keyPath];

    view.layer.position                   = fromeValue;

    CABasicAnimation *scaleAnimation      = [CABasicAnimation animationWithKeyPath:@"transform.scale"];

    scaleAnimation.duration               = animationDuration;

    scaleAnimation.timingFunction         = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    scaleAnimation.fromValue              = [NSNumber numberWithFloat:1.f];

    scaleAnimation.toValue                = [NSNumber numberWithFloat:0.001f];

    scaleAnimation.beginTime              = CACurrentMediaTime() + (animationDuration * 1.0/self.subViews.count * (self.subViews.count - index - 1));

    scaleAnimation.fillMode               = kCAFillModeForwards;

    scaleAnimation.removedOnCompletion    = NO;

    scaleAnimation.delegate               = self;

    [view.layer addAnimation:scaleAnimation forKey:scaleAnimation.keyPath];

    view.transform                        = CGAffineTransformMakeScale(1.f, 1.f);

    _isClick                              = NO;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (++_frequency == self.subViews.count) {
        
        _isClick = YES;
        
        _frequency = 0;
    }
}

@end
