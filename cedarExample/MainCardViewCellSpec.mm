#import <Cedar/Cedar.h>
#import "MainCardViewCell.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(MainCardViewCellSpec)

describe(@"MainCardViewCell", ^{
    __block MainCardViewCell *subject;

    beforeEach(^{
        subject = [[MainCardViewCell alloc] init];
    });
});

SPEC_END
