//
//  Employee.h
//  cedarExample
//
//  Created by Nico on 4/15/16.
//  Copyright © 2016 Globant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSString *employeeDescription;
@property (copy, nonatomic, readonly) NSString *employeeProfileImage;

- (id) initWithName: (NSString *) name
        description:(NSString*) description
       profileImage:(NSString *) image;

@end
