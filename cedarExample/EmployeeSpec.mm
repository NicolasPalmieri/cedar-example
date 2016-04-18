#import <Cedar/Cedar.h>
#import "SpecHelper.h"
#import "Employee.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(EmployeeSpec)

describe(@"Employee", ^{
    __block Employee *model;

    beforeEach(^{
        model = [[Employee alloc] initWithName:@"Bob"
                                   description:@"He's the product owner"
                                  profileImage:@"icon_random"];
    });
    
    describe(@"equality", ^{
        __block Employee *otherEmployee;
        
        beforeEach(^{
            otherEmployee = [[Employee alloc] initWithName:@"Matt"
                                               description:@"He was the product guy"
                                              profileImage:@"icon_med"];
        });
        
        it(@"should create objects of the same class", ^{
            otherEmployee should be_instance_of([Employee class]);
        });
    });
    
    describe(@"validating the structure", ^{
        it(@"should have the correct types", ^{
            //3 different ways to assert
            [model.name isKindOfClass:[NSString class]] should be_truthy;
            [model.employeeDescription isKindOfClass:[NSString class]] should equal(TRUE);
            [model.employeeProfileImage isKindOfClass:[NSString class]] should equal(YES);
        });
        
        it(@"should have the correct values (viceversa)", ^{
            //same example
            [model.name isKindOfClass:[NSString class]] should_not be_falsy;
            [model.employeeDescription isKindOfClass:[NSString class]] should_not equal(FALSE);
            [model.employeeProfileImage isKindOfClass:[NSString class]] should_not equal(NO);
        });
    });
    
    //we can declare a shared-example when the behavior is quite common
    sharedExamplesFor(@"creating an Employee object", ^(NSDictionary *sharedContext) {
        [model.name isKindOfClass:[NSString class]] should be_truthy;
        [model.employeeDescription isKindOfClass:[NSString class]] should equal(TRUE);
        [model.employeeProfileImage isKindOfClass:[NSString class]] should equal(YES);
        model should be_instance_of([Employee class]);
    });
    
    //shared-example implementation
    describe(@"when the behavior is quite common", ^{
        it(@"should behave like an object of this class", ^{
            itShouldBehaveLike(@"creating an Employee object");
        });
    });
});

SPEC_END
