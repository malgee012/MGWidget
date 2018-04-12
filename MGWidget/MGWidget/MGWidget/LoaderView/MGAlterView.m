//
//  MGAlterView.m
//  MGWidget
//
//  Created by acmeway on 2018/4/12.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGAlterView.h"

@interface MGAlterView ()<CAAnimationDelegate>
{
    BOOL _isReversal;
}
@property (nonatomic, strong) UIView *leftDot;

@property (nonatomic, strong) UIView *middleDot;

@property (nonatomic, strong) UIView *rightDot;

@property (nonatomic, strong) NSMutableArray *colors;

@end
@implementation MGAlterView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.colors = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor]].mutableCopy;
        
        [self addSubview:self.rightDot];
        
        [self addSubview:self.middleDot];
        
        [self addSubview:self.leftDot];
        
    }
    return self;
}

- (void)showAnimationView
{
    
    CABasicAnimation *animation1 = [self animationKeyPath1:@"position.x"
                                                           to:@(self.leftDot.layer.position.x + 40)
                                                     duration:1
                                                          key:@"animation1"
                                                   isReverses:NO
                                                   repeatTime:1];
    
    [self.leftDot.layer addAnimation:animation1 forKey:animation1.keyPath];
    
    CABasicAnimation *animation2 = [self animationKeyPath1:@"position.x"
                                                        to:@(self.rightDot.layer.position.x - 40)
                                                  duration:1
                                                       key:@"animation2"
                                                   isReverses:NO
                                                   repeatTime:1];
    
    [self.rightDot.layer addAnimation:animation2 forKey:animation2.keyPath];
}

- (CABasicAnimation *)animationKeyPath1:(NSString *)keyPath
                                    to:(NSNumber *)toValue
                              duration:(CFTimeInterval)duration
                                   key:(NSString *)key
                            isReverses:(BOOL)isReverses
                            repeatTime:(CGFloat)repeat
{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:keyPath];

    animation.toValue             = toValue;

    animation.duration            = duration;

    animation.autoreverses        = isReverses;

    animation.repeatCount         = repeat;

    animation.delegate            = self;

    [animation setValue:key forKey:@"animatioin"];
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    return animation;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if ([[anim valueForKey:@"animatioin"] isEqualToString:@"animation1"]) {
        
        _isReversal = !_isReversal;
        
        if (_isReversal)
        {
            self.leftDot.backgroundColor  = self.colors.lastObject;

            self.rightDot.backgroundColor = self.colors.firstObject;
        }
        else
        {
            self.leftDot.backgroundColor  = self.colors.firstObject;

            self.rightDot.backgroundColor = self.colors.lastObject;
        }
        
        [self showAnimationView];
    }
   
}

- (UIView *)leftDot
{
    if (!_leftDot) {
        _leftDot                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];

        _leftDot.centerY             = self.centerY;

        _leftDot.centerX             = self.centerX - 20;

        _leftDot.layer.cornerRadius  = 5;

        _leftDot.layer.masksToBounds = YES;

        _leftDot.backgroundColor     = self.colors[0];
    }
    return _leftDot;
}

- (UIView *)middleDot
{
    if (!_middleDot) {
        _middleDot                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];

        _middleDot.centerY             = self.centerY;

        _middleDot.centerX             = self.centerX;

        _middleDot.layer.cornerRadius  = 5;

        _middleDot.layer.masksToBounds = YES;

        _middleDot.backgroundColor     = self.colors[1];
    }
    return _middleDot;
}

- (UIView *)rightDot
{
    if (!_rightDot) {
        _rightDot                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];

        _rightDot.centerY             = self.centerY;

        _rightDot.centerX             = self.centerX + 20;

        _rightDot.layer.cornerRadius  = 5;

        _rightDot.layer.masksToBounds = YES;

        _rightDot.backgroundColor     = self.colors[2];
    }
    return _rightDot;
}

@end

#pragma mark -
#pragma mark - MGAlternationView

@interface MGAlternationView ()

//@property (nonatomic, strong) UIView *leftDot;
//
//@property (nonatomic, strong) UIView *middleDot;
//
//@property (nonatomic, strong) UIView *rightDot;

@property (nonatomic, strong) UILabel *leftDot;

@property (nonatomic, strong) UILabel *middleDot;

@property (nonatomic, strong) UILabel *rightDot;

@property (nonatomic, strong) NSMutableArray *colors;

@end
@implementation MGAlternationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.colors = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor]].mutableCopy;
        
        [self addSubview:self.rightDot];
        
        [self addSubview:self.middleDot];
        
        [self addSubview:self.leftDot];
        
    }
    return self;
}

- (void)showAnimationView
{
    CABasicAnimation *animation1 = [self.leftDot.layer animationKeyPath:@"position.x"
                                                               position:CGPointMake(self.leftDot.layer.position.x + 20, self.centerY)
                                                               duration:1
                                                                    key:@"animation1"
                                                             isReverses:NO
                                                             repeatTime:1];
    [self.leftDot.layer addAnimation:animation1 forKey:animation1.keyPath];
    
    
    CABasicAnimation *animation2 = [self.rightDot.layer animationKeyPath:@"position.x"
                                                               position:CGPointMake(self.rightDot.layer.position.x - 20, self.centerY)
                                                               duration:1
                                                                    key:@"animation2"
                                                             isReverses:NO
                                                             repeatTime:1];

    [self.rightDot.layer addAnimation:animation2 forKey:animation2.keyPath];
    
}



- (UILabel *)leftDot
{
    if (!_leftDot) {
        _leftDot                     = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _leftDot.text = @"1";
        
        _leftDot.centerY             = self.centerY;
        
        _leftDot.centerX             = self.centerX - 20;
        
        _leftDot.layer.cornerRadius  = 5;
        
        _leftDot.layer.masksToBounds = YES;
        
        _leftDot.backgroundColor     = self.colors[0];
    }
    return _leftDot;
}

- (UILabel *)middleDot
{
    if (!_middleDot) {
        _middleDot                     = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _middleDot.text = @"2";
        
        _middleDot.centerY             = self.centerY;
        
        _middleDot.centerX             = self.centerX;
        
        _middleDot.layer.cornerRadius  = 5;
        
        _middleDot.layer.masksToBounds = YES;
        
        _middleDot.backgroundColor     = self.colors[1];
    }
    return _middleDot;
}

- (UILabel *)rightDot
{
    if (!_rightDot) {
        _rightDot                     = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _rightDot.text = @"3";
        
        _rightDot.centerY             = self.centerY;
        
        _rightDot.centerX             = self.centerX + 20;
        
        _rightDot.layer.cornerRadius  = 5;
        
        _rightDot.layer.masksToBounds = YES;
        
        _rightDot.backgroundColor     = self.colors[2];
    }
    return _rightDot;
}

//- (UIView *)leftDot
//{
//    if (!_leftDot) {
//        _leftDot                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
//
//        _leftDot.centerY             = self.centerY;
//
//        _leftDot.centerX             = self.centerX - 20;
//
//        _leftDot.layer.cornerRadius  = 5;
//
//        _leftDot.layer.masksToBounds = YES;
//
//        _leftDot.backgroundColor     = self.colors[0];
//    }
//    return _leftDot;
//}
//
//- (UIView *)middleDot
//{
//    if (!_middleDot) {
//        _middleDot                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
//
//        _middleDot.centerY             = self.centerY;
//
//        _middleDot.centerX             = self.centerX;
//
//        _middleDot.layer.cornerRadius  = 5;
//
//        _middleDot.layer.masksToBounds = YES;
//
//        _middleDot.backgroundColor     = self.colors[1];
//    }
//    return _middleDot;
//}
//
//- (UIView *)rightDot
//{
//    if (!_rightDot) {
//        _rightDot                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
//
//        _rightDot.centerY             = self.centerY;
//
//        _rightDot.centerX             = self.centerX + 20;
//
//        _rightDot.layer.cornerRadius  = 5;
//
//        _rightDot.layer.masksToBounds = YES;
//
//        _rightDot.backgroundColor     = self.colors[2];
//    }
//    return _rightDot;
//}
@end



