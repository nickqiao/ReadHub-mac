//
//  MainViewController.m
//  ReadHub
//
//  Created by nickchen on 2018/1/17.
//  Copyright © 2018年 chenyuqiao. All rights reserved.
//

#import "MainViewController.h"
#import "MainCell.h"
#import "Article.h"
#import "YQNetworkHelper.h"
#import <YYModel.h>

@interface MainViewController () <NSTableViewDelegate, NSTableViewDataSource>
@property (weak) IBOutlet NSTableView *tableView;
@property (strong, nonatomic) NSMutableArray *article_array;
@end

@implementation MainViewController

static NSString *TOPIC_URL = @"https://api.readhub.me/topic";
static NSString *MAIN_CELL_ID = @"maincell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _article_array = [NSMutableArray arrayWithCapacity:20];
    [_tableView registerNib: [[NSNib alloc] initWithNibNamed:@"MainCell" bundle:nil] forIdentifier:MAIN_CELL_ID];
    [self loadPage:0];
}

#pragma mark -
#pragma mark ***** Net *****
- (void)loadPage:(NSUInteger) page {
    [YQNetworkHelper GET:TOPIC_URL parameters:nil success:^(id responseObject) {
        
        NSDictionary *dict = responseObject;
        NSArray *data = [NSArray yy_modelArrayWithClass:[Article class] json:dict[@"data"]];
        [_article_array addObjectsFromArray:data];
        [_tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -
#pragma mark ***** NSTableViewDelegate *****

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _article_array.count;
}

#pragma mark -
#pragma mark ***** NSTableViewDataSource *****

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    MainCell *cell = [tableView  makeViewWithIdentifier:MAIN_CELL_ID owner:self];
    cell.titleText.textColor = [NSColor blackColor];
    Article *article = _article_array[row];
    cell.titleText.stringValue = article.summary;
    cell.timeText.stringValue = @"dddd";
    return cell;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 160;
}

@end
