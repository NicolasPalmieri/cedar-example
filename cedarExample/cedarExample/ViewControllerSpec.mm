#import <Cedar/Cedar.h>
#import "ViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    __block ViewController *subject;

    beforeEach(^{
        subject = [[ViewController alloc] init];
    });
});

SPEC_END
