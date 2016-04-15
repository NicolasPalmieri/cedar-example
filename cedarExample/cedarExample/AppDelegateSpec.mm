#import <Cedar/Cedar.h>
#import "AppDelegate.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *subject;

    beforeEach(^{
        subject = [[AppDelegate alloc] init];
    });
});

SPEC_END
