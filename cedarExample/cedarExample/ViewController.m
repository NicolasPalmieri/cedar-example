//
//  ViewController.m
//  cedarExample
//
//  Created by Nico on 4/15/16.
//  Copyright © 2016 Globant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *arrayForFirstSection;
@property (strong, nonatomic) NSArray *arrayForSecondSection;

@end

@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.title = @"HELLO-THERE!";
    
    [self createSomeGlobantEmployeesANDFillArraysWithEm];
    
    UINib *cellNib = [UINib nibWithNibName:@"MainCardViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"MainCardViewCell"];
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor grayColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.arrayForFirstSection.count;
    } else {
        return self.arrayForSecondSection.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainCardViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCardViewCell" forIndexPath:indexPath];
    if (indexPath.section ==0) {
        [cell setupWithThisObject:self.arrayForFirstSection[indexPath.row]];
    } else {
        [cell setupWithThisObject:self.arrayForSecondSection[indexPath.row]];
    } return cell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"heyo!"
                                                                   message:@"seems you click a row"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *someAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {}];
    
    [alert addAction:someAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *headerLabel = [[UILabel alloc]init];
    headerLabel.font = [UIFont fontWithName:@"System" size:14];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor blackColor];
    headerLabel.text = (section == 0) ? @"iOS": @"Android";
    return headerLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private

- (void) createSomeGlobantEmployeesANDFillArraysWithEm {
    Employee *iOS1st = [[Employee alloc] initWithName:@"Nicolas Palmieri"
                                          description:@"un campeón clase '89"
                                         profileImage:@"icon_high"];
    Employee *iOS2nd = [[Employee alloc] initWithName:@"Ezequiel Munz"
                                          description:@"un loco de por ahi"
                                         profileImage:@"icon_med"];
    Employee *android1st = [[Employee alloc] initWithName:@"Fernando Peña"
                                              description:@"el hombre mas molesto que existe"
                                             profileImage:@"icon_low"];
    Employee *android2nd = [[Employee alloc] initWithName:@"Agustin Gugliotta"
                                              description:@"no llega al metro50"
                                             profileImage:@"icon_random"];
    Employee *android3rd = [[Employee alloc] initWithName:@"Unknown"
                                              description:@"codea"
                                             profileImage:@"icon_random"];
    
    self.arrayForFirstSection = [[NSArray alloc] initWithObjects:iOS1st, iOS2nd, nil];
    self.arrayForSecondSection = [[NSArray alloc] initWithObjects:android1st, android2nd, android3rd, nil];
}

@end
