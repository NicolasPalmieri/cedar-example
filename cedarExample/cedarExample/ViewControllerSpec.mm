#import <Cedar/Cedar.h>
#import "SpecHelper.h"
#import "ViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

@interface ViewController (Spec)

//@property in case needed

@end

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    __block ViewController *subject;
    __block id <BSInjector, BSBinder> injector;

    beforeEach(^{
        //helper
        injector = [CDRSpecHelper injector];
        
        //dependencys
        [injector bind:[ViewController class] toInstance:subject];
  
        //always at the very bottom
        subject = [injector getInstance:[ViewController class]];
        subject.view should_not be_nil;
    });
    
    it(@"should have a title", ^{
        subject.title should equal(@"HELLO-THERE");
    });
});

SPEC_END
