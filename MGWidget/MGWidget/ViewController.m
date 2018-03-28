//
//  ViewController.m
//  MGWidget
//
//  Created by acmeway on 2018/3/28.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *displayTalbleView;

@end

static NSString *const reuseIdentifiter = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.displayTalbleView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifiter];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifiter];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@">>> %ld", indexPath.row];
    
    NSInteger rows = [tableView numberOfRowsInSection:indexPath.section];
    
    cell.backgroundColor = [MGColor colorWithAlphaComponent:(rows - indexPath.row *0.5)/rows];
    
    return cell;
}

- (UITableView *)displayTalbleView
{
    if (!_displayTalbleView) {
        
        _displayTalbleView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        
        _displayTalbleView.delegate = self;
        
        _displayTalbleView.dataSource = self;
        
        _displayTalbleView.separatorColor = [UIColor whiteColor];
        
        _displayTalbleView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
    }
    return _displayTalbleView;
}

@end
