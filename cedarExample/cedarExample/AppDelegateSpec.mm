#import <Cedar/Cedar.h>
#import "SpecHelper.h"
#import "AppDelegate.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *subject;
    __block id <BSInjector, BSBinder> injector;
    __block UIApplication *application;

    beforeEach(^{
        subject = [[AppDelegate alloc] init];
        injector = [CDRSpecHelper injector];
        //injector = (id)subject.injector;
        
        application = nice_fake_for([UIApplication class]);
        
        [injector bind:[UIApplication class] toInstance:application];
        
        [subject application:application didFinishLaunchingWithOptions:@{}];
    });
});

SPEC_END
