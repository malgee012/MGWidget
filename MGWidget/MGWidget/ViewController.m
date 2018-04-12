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
                    @[@"MGEffectStyleDrop",
                      @"MGEffectStyleThimble",
                      @"MGEffectStyleCircle",
                      @"MGEffectStyleStrip",
                      @"MGEffectStyleWoody",
                      @"MGEffectStyleShape",
                      @"MGEffectStyleLinear",
                      @"MGEffectStyleInverted"],
                    @[@"MGLoaderStyleTriangle",
                      @"MGLoaderStyleCationDot",
                      @"MGLoaderStyleExpandDot",
                      @"MGLoaderStyleShipDot",
                      @"MGLoaderStyleChain",
                      @"MGLoaderStyleAlter",
                      @"MGLoaderStyleAlternation"]
                    ].mutableCopy;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _styleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *dateArray = _styleArray[section];
    
    return dateArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifiter];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifiter];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSArray *dateArray  = _styleArray[indexPath.section];

    cell.textLabel.text = dateArray[indexPath.row];

    NSInteger rows      = [tableView numberOfRowsInSection:indexPath.section];

    cell.backgroundColor = [MGColor colorWithAlphaComponent:(rows - indexPath.row *0.5) / rows];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label     = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];

    label.textAlignment = NSTextAlignmentCenter;

    label.textColor     = kBgColor;
    
    if (section == 0)
    {
        label.text = @"MGEffectStyle";
    }
    else if (section == 1)
    {
        label.text = @"MGLoaderStyle";
    }
    
    return label;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    MGShowController *showVC = [[MGShowController alloc] initWithType:indexPath.row section:indexPath.section];

    showVC.title             = _styleArray[indexPath.section][indexPath.row];

    [self.navigationController pushViewController:showVC animated:YES];
}

- (UITableView *)displayTableView
{
    if (!_displayTableView) {

        _displayTableView                  = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

        _displayTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

        _displayTableView.delegate         = self;

        _displayTableView.dataSource       = self;

        _displayTableView.separatorColor   = [UIColor whiteColor];

        _displayTableView.separatorInset   = UIEdgeInsetsMake(0, 0, 0, 0);

    }
    return _displayTableView;
}

@end
