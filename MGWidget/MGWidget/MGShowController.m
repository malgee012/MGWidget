//
//  MGShowController.m
//  MGWidget
//
//  Created by acmeway on 2018/3/29.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "MGShowController.h"
#import "MGShowView.h"
#import "MGLoaderView.h"
@interface MGShowController ()<CAAnimationDelegate>

@property (nonatomic, assign) MGEffectStyle type;

@property (nonatomic, assign) NSInteger section;

@end

@implementation MGShowController

- (instancetype)initWithType:(MGEffectStyle)type section:(NSInteger)section
{
    if (self = [super init]) {
        
        self.type = type;
        
        self.section = section;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.section == 0)
    {
        MGShowView *showView = [MGShowView showWithType:_type];
        
        [self.view addSubview:showView];
    }
    else
    {
        
        for (int i = 0; i < 3; i++) {
        
            MGLoaderView *loaderView = [MGLoaderView loader];
            
            loaderView.centerX = self.view.centerX;
            
            loaderView.y = 30 + (100 + 30) * i;
            
            loaderView.style = i;
        
            [self.view addSubview:loaderView];
        }
        
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
