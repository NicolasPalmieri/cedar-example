//
//  MainCardViewCell.m
//  cedarExample
//
//  Created by Nico on 4/15/16.
//  Copyright © 2016 Globant. All rights reserved.
//

#import "MainCardViewCell.h"
#import "UIColor+CE.h"

@implementation MainCardViewCell

- (void)setupWithThisObject:(Employee *)specificEmployee {
    self.employee = specificEmployee;
    
    [self setupNameLabel];
    [self setupSubtitleLabel];
    [self setupLogoImage];
}

- (void)setupNameLabel {
    self.titleLabel.font = [UIFont fontWithName:@"System" size:18];
    self.titleLabel.textColor = [UIColor thatGreenTho];
    self.titleLabel.text = self.employee.name;
}

- (void)setupSubtitleLabel {
    self.descriptionLabel.font = [UIFont fontWithName:@"System" size:14];
    self.descriptionLabel.textColor = [UIColor thisOrange];
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.text = self.employee.employeeDescription;
}

- (void)setupLogoImage {
    [self.imageIcon setImage:[UIImage imageNamed: self.employee.employeeProfileImage]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    //TODO if ya' want
}

@end
