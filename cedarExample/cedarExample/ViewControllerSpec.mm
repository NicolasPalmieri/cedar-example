//#import <Cedar/Cedar.h>
//#import "SpecHelper.h"
//#import "ViewController.h"
//
//using namespace Cedar::Matchers;
//using namespace Cedar::Doubles;
//
//SPEC_BEGIN(ViewControllerSpec)
//
//describe(@"ViewController", ^{
//    __block ViewController *subject;
//    __block id <BSInjector, BSBinder> injector;
//    __block MainCardViewCell *cell;
//    __block Employee *employee1;
//    __block Employee *employee2;
//    __block NSArray *arrayForSection;
//
//    beforeEach(^{
//        //helper
//        injector = [CDRSpecHelper injector];
//        
//        employee1 = [[Employee alloc] initWithName:@"first-name"
//                                       description:@"first-description"
//                                      profileImage:@"first-icon"];
//        
//        employee2 = [[Employee alloc] initWithName:@"second-name"
//                                       description:@"second-description"
//                                      profileImage:@"second-icon"];
//        
//        arrayForSection = [[NSArray alloc] initWithObjects:employee1, employee2, nil];
//        
//        //dependencys-binds:
//        //instantiate the cell that we want to test
//        UINib *nib = [UINib nibWithNibName:@"MainCardViewCell" bundle:nil];
//        cell = [[nib instantiateWithOwner:nil options:nil] firstObject];
//        spy_on(cell);
//        
//        //always at the very bottom
//        subject = [injector getInstance:[ViewController class]];
//        subject.view should_not be_nil;
//    });
//    
//    subjectAction(^{
//        [cell setupWithThisArray:arrayForSection];
//    });
//    
//    describe(@"setupWithThisArray", ^{
//        context(@"creating the 1st Employee cell", ^{
//            beforeEach(^{
//                arrayForSection = arrayForSection[0];
//            });
//        });
//        
//        it(@"should set the name-label", ^{
//            cell.titleLabel.text should equal(@"first-name");
//        });
//        
//        it(@"should set the subtitle-label", ^{
//            cell.descriptionLabel.text should equal(@"first-description");
//        });
//        
//        it(@"should set the logo-image", ^{
//            cell.imageIcon.image should equal([UIImage imageNamed:@"first-icon"]);
//        });
//        
//        context(@"creating the 2nd Employee cell", ^{
//            beforeEach(^{
//                arrayForSection = arrayForSection[1];
//            });
//        });
//        
//        it(@"should set the name-label", ^{
//            cell.titleLabel.text should equal(@"second-name");
//        });
//        
//        it(@"should set the subtitle-label", ^{
//            cell.descriptionLabel.text should equal(@"second-description");
//        });
//        
//        it(@"should set the logo-image", ^{
//            cell.imageIcon.image should equal([UIImage imageNamed:@"second-icon"]);
//        });
//    });
//});
//
//SPEC_END
