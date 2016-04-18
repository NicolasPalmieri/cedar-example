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
        
        it(@"should return true for identical employees", ^{
            model should equal(otherEmployee);
        });
    });
});

SPEC_END
