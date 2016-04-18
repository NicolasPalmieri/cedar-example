#import <Cedar/Cedar.h>
#import "SpecHelper.h"
#import "MainCardViewCell.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(MainCardViewCellSpec)

describe(@"MainCardViewCell", ^{
    __block MainCardViewCell *subject;
    __block id <BSInjector, BSBinder> injector;

    beforeEach(^{
        injector = [CDRSpecHelper injector];
        
        subject = [injector getInstance:[MainCardViewCell class]];
    });
});

SPEC_END
