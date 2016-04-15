#import <Cedar/Cedar.h>
#import "SpecHelper.h"
#import "Blindside.h"
#import "Employee.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(EmployeeSpec)

describe(@"Employee", ^{
    __block Employee *subject;

    beforeEach(^{
        subject = [[Employee alloc] init];
    });
});

SPEC_END
