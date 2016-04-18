//
//  MainCardViewCell.h
//  cedarExample
//
//  Created by Nico on 4/15/16.
//  Copyright © 2016 Globant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface MainCardViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (strong, nonatomic) Employee *employee;

- (void)setupWithThisObject:(Employee *)specificEmployee;

@end
