//
//  Employee.m
//  cedarExample
//
//  Created by Nico on 4/15/16.
//  Copyright © 2016 Globant. All rights reserved.
//

#import "Employee.h"

@interface Employee ()

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *employeeDescription;
@property (copy, nonatomic) NSString *employeeProfileImage;

@end

@implementation Employee

- (id) initWithName: (NSString *) name
        description:(NSString*) description
       profileImage:(NSString *) image {
    self = [super init];
    if (self) {
        self.name = name;
        self.employeeDescription = description;
        self.employeeProfileImage = image;
    } return self;
}

#pragma mark - NSObject

- (id)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end
