#import <Cedar/Cedar.h>
#import "SpecHelper.h"
#import "MainCardViewCell.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(MainCardViewCellSpec)
__block MainCardViewCell *cell;

describe(@"MainCardViewCell", ^{
    beforeEach(^{
        //instantiate the cell that we want to test
        UINib *nib = [UINib nibWithNibName:@"MainCardViewCell" bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] firstObject];
    });
    
    describe(@"setting the cell", ^{
        context(@"title:", ^{
            it(@"should have the correct font", ^{
                cell.titleLabel should_not be_nil;
            });
        });
        
        context(@"subtitle:", ^{
            it(@"should have the correct font", ^{
                cell.descriptionLabel.font should_not be_nil;
            });
            
            it(@"should have the correct numberOfLines", ^{
                cell.descriptionLabel.numberOfLines should equal(1);
            });
        });
    });

    //we can declare a shared-example when the behavior is quite common
    sharedExamplesFor(@"like a title", ^(NSDictionary *sharedContext) {
        cell.titleLabel should_not be_nil;
    });
    
    sharedExamplesFor(@"like a subtitle", ^(NSDictionary *sharedContext) {
        cell.descriptionLabel.font should_not be_nil;
        cell.descriptionLabel.numberOfLines should equal(1);
    });
    
    //and finally chain those behaviors in one single assert
    describe(@"shouldBehaveLike:", ^{
        context(@"a MainCardViewCell", ^{
            it(@"should build a cell", ^{
                itShouldBehaveLike(@"like a title");
                itShouldBehaveLike(@"like a subtitle");
            });
        });
    });
});

SPEC_END
