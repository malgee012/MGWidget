//
//  ViewController.m
//  MGWidget
//
//  Created by acmeway on 2018/3/28.
//  Copyright © 2018年 acmeway. All rights reserved.
//

#import "ViewController.h"
#import "MGShowController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *displayTableView;

@property (nonatomic, strong) NSMutableArray *styleArray;

@end

static NSString *const reuseIdentifiter = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.view addSubview:self.displayTableView];
    
    self.displayTableView.rowHeight = 50;
    
    _styleArray = @[
                    @"MGEffectStyleDrop",
                    @"MGEffectStyleThimble",
                    @"MGEffectStyleCircle",
                    @"MGEffectStyleStrip"
                    ].mutableCopy;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _styleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifiter];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifiter];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = _styleArray[indexPath.row];
    
    NSInteger rows = [tableView numberOfRowsInSection:indexPath.section];
    
    cell.backgroundColor = [MGColor colorWithAlphaComponent:(rows - indexPath.row *0.5)/rows];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MGShowController *showVC = [[MGShowController alloc] initWithType:indexPath.row];
    
    [self.navigationController pushViewController:showVC animated:YES];
}

- (UITableView *)displayTableView
{
    if (!_displayTableView) {
        
        _displayTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        
        _displayTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        _displayTableView.delegate = self;
        
        _displayTableView.dataSource = self;
        
        _displayTableView.separatorColor = [UIColor whiteColor];
        
        _displayTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
    }
    return _displayTableView;
}

@end
