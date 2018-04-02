//
//  MGPatternView.h
//  MGWidget
//
//  Created by acmeway on 2018/4/1.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MGMotorDirection) {
    
    MGMotorDirectionUp,
    MGMotorDirectionLeft,
    MGMotorDirectionDown,
    MGMotorDirectionRight
};

@interface MGPatternView : UIView

@property (nonatomic, copy) void(^PatterviewBlock)(NSInteger index);

@property (nonatomic, assign) MGMotorDirection  motorDirection;

@property (nonatomic, strong) NSArray <UIButton *>*subViews;

@property (nonatomic, assign) CGFloat viewSpacing;

@property (nonatomic, assign) CGFloat animationDuration;

@end
