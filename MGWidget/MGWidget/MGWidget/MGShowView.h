//
//  MGShowView.h
//  MGWidget
//
//  Created by acmeway on 2018/3/29.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGShowView : UIView

@property (nonatomic, assign) MGEffectStyle type;

+ (instancetype)showWithType:(MGEffectStyle)type;

@end
