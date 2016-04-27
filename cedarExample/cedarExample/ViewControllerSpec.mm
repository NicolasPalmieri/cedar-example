#import <Cedar/Cedar.h>
#import "SpecHelper.h"
#import "ViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

@interface ViewController (Spec)

@property (strong, nonatomic) NSArray *arrayForSection1;
@property (strong, nonatomic) NSArray *arrayForSection2;

@end

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    __block ViewController *subject;
    __block UINavigationController *navigationController;
    __block MainCardViewCell *cell;
    __block Employee *employee1;
    __block Employee *employee2;
    __block Employee *employee3;
    __block Employee *employee4;
    __block Employee *employee5;
    __block NSArray *fakeArray1stSection;
    __block NSArray *fakeArray2ndSection;
    __block UIAlertController *fakeAlertController;
    __block UIAlertAction *someAction;
    __block UIImage *imageModel1;
    __block UIImage *imageModel2;

    beforeEach(^{
        UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        subject = [storyB instantiateViewControllerWithIdentifier:@"ViewController"];
        
        employee1 = [[Employee alloc] initWithName:@"first-name"
                                       description:@"first-description"
                                      profileImage:@"first-icon"];
        
        employee2 = [[Employee alloc] initWithName:@"second-name"
                                       description:@"second-description"
                                      profileImage:@"second-icon"];
        
        employee3 = [[Employee alloc] initWithName:@"third-name"
                                       description:@"third-description"
                                      profileImage:@"third-icon"];
        
        employee4 = [[Employee alloc] initWithName:@"fourth-name"
                                       description:@"fourth-description"
                                      profileImage:@"fourth-icon"];
        
        employee5 = [[Employee alloc] initWithName:@"fifth-name"
                                       description:@"fifth-description"
                                      profileImage:@"fifth-icon"];
        
        fakeArray1stSection = [[NSArray alloc] initWithObjects:employee1, employee2, nil];
        fakeArray2ndSection = [[NSArray alloc] initWithObjects:employee3, employee4, employee5, nil];
        
        fakeAlertController = [UIAlertController alertControllerWithTitle:@"heyo!"
                                                    message:@"seems you click a row"
                                             preferredStyle:UIAlertControllerStyleAlert];
        
        someAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {}];
        
        [fakeAlertController addAction:someAction];
        
        imageModel1 = nice_fake_for([UIImage class]);
        imageModel2 = nice_fake_for([UIImage class]);
        cell = nice_fake_for([MainCardViewCell class]);
        
        //we cannot use the following method for storyboards :(
        //subject = [injector getInstance:[ViewController class]];
        
        navigationController = [[UINavigationController alloc] init];
        navigationController.viewControllers = @[subject];
        spy_on(navigationController);
        
        //always at the very bottom
        subject.view should_not be_nil;
        navigationController.topViewController should be_same_instance_as(subject);
    });
    
    it(@"should have a title", ^{
        subject.title should equal(@"HELLO-THERE!");
    });
    
    describe(@"viewDidLoad:", ^{
        beforeEach(^{
            [subject viewDidLoad];
        });
        
        it(@"should have a table-view", ^{
            subject.tableView should be_instance_of([UITableView class]);
        });
        
        it(@"should be its table-view delegate", ^{
            subject.tableView.delegate should be_same_instance_as(subject);
        });
        
        it(@"should be its table-view datasource", ^{
            subject.tableView.dataSource should be_same_instance_as(subject);
        });
        
        it(@"should have the background color setted to clear", ^{
            subject.tableView.backgroundColor should equal([UIColor clearColor]);
        });
        
        it(@"should have the separator-style as none", ^{
            subject.tableView.separatorStyle should equal(UITableViewCellSeparatorStyleNone);
        });
    });
    
    describe(@"-numberOfSectionsInTableView:", ^{
        it(@"should return 2 sections", ^{
            [subject numberOfSectionsInTableView:subject.tableView] should equal(2);
        });
    });
    
    describe(@"-tableview:numberOfRowsInSection:", ^{
        context(@"1st section", ^{
            it(@"should return 2", ^{
                [subject tableView:subject.tableView numberOfRowsInSection:0] should equal(2);
            });
        });
        
        context(@"2nd section", ^{
            it(@"should return 3", ^{
                [subject tableView:subject.tableView numberOfRowsInSection:1] should equal(3);
            });
        });
    });
    
    describe(@"-tableView:cellForRowAtIndexPath:", ^{
        context(@"creating the 1st Employee cell", ^{
            beforeEach(^{
                cell = (MainCardViewCell *)[subject tableView:subject.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
                [cell setupWithThisObject:fakeArray1stSection[0]];
            });
            
            it(@"should set the name-label", ^{
                cell.titleLabel.text should equal(@"first-name");
            });
            
            it(@"should set the subtitle-label", ^{
                cell.descriptionLabel.text should equal(@"first-description");
            });
        });
        
        context(@"creating the 2nd Employee cell", ^{
            beforeEach(^{
                cell = (MainCardViewCell *)[subject tableView:subject.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
                [cell setupWithThisObject:fakeArray2ndSection[1]];
            });
            
            it(@"should set the name-label", ^{
                cell.titleLabel.text should equal(@"fourth-name");
            });
            
            it(@"should set the subtitle-label", ^{
                cell.descriptionLabel.text should equal(@"fourth-description");
            });
        });
    });
    
    describe(@"-heightForRowAtIndexPath:", ^{
        __block CGFloat height;
        
        beforeEach(^{
            height = [subject tableView:subject.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:1]];
        });
        
        it(@"should return the correct value", ^{
            height should equal(90.0f);
        });
    });
    
    describe(@"-tableView:didSelectRowAtIndexPath", ^{
        context(@"a row from the first-section being selected", ^{
            beforeEach(^{
                [subject tableView:subject.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
            });
            
            it(@"should pops an alertView/controller", ^{
                navigationController should have_received(@selector(presentViewController:animated:completion:));
            });
        });
        
        context(@"a row from the second-section being selected", ^{
            beforeEach(^{
                [subject tableView:subject.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:1]];
            });
            
            it(@"should pops an alertView", ^{
                navigationController should have_received(@selector(presentViewController:animated:completion:));
            });
        });
    });
    
    describe(@"-viewForHeaderInSection:", ^{
        __block UILabel *fakeLabel;
        __block NSInteger section;
        
        subjectAction(^{
            fakeLabel = (UILabel *) [subject tableView:subject.tableView viewForHeaderInSection:section];
        });
        
        context(@"for the 1st-section", ^{
            beforeEach(^{
                section = 0;
            });
            
            it(@"should have the correct text/title", ^{
                fakeLabel.text should equal(@"iOS");
            });
        });
      
        context(@"for the 2nd-section", ^{
            beforeEach(^{
                section = 1;
            });
            
            it(@"should have the correct text/title", ^{
                fakeLabel.text should equal(@"Android");
            });
        });
    });
});

SPEC_END
