//
//  ViewController.m
//  cedarExample
//
//  Created by Nico on 4/15/16.
//  Copyright © 2016 Globant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:@"MainCardViewCell" bundle:nil];
    [self.mainTableView registerNib:cellNib forCellReuseIdentifier:@"MainCardViewCell"];
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor grayColor];
    self.mainTableView.backgroundColor = [UIColor clearColor];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //TODO
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

#pragma mark - DelegateMethods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *headerLabel = [[UILabel alloc]init];
    headerLabel.font = [UIFont fontWithName:@"System" size:14];
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = (section == 0) ? @"FIRST-SECTION": @"SECOND-SECTION";
    return headerLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
