#import <Cedar/Cedar.h>
#import "SpecHelper.h"
#import "Blindside.h"
#import "ViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    __block ViewController *subject;
    __block id <BSInjector, BSBinder> injector;

    beforeEach(^{
        injector = [CDRSpecHelper injector];
        subject = [[ViewController alloc] init];
        
    });
    
    it(@"should have a title", ^{
        subject.title should equal(@"HELLO-THERE");
    });
});

SPEC_END
