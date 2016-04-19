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
    __block MainCardViewCell *cell;
    __block Employee *employee1;
    __block Employee *employee2;
    __block Employee *employee3;
    __block Employee *employee4;
    __block Employee *employee5;
    __block NSArray *fakeArray1stSection;
    __block NSArray *fakeArray2ndSection;
    __block UIAlertController *alert;
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
        
        alert = [UIAlertController alertControllerWithTitle:@"heyo!"
                                                    message:@"seems you click a row"
                                             preferredStyle:UIAlertControllerStyleAlert];
        
        someAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {}];
        
        imageModel1 = nice_fake_for([UIImage class]);
        imageModel2 = nice_fake_for([UIImage class]);
        cell = nice_fake_for([MainCardViewCell class]);
        
        //we cannot use the following method for storyboards :(
        //subject = [injector getInstance:[ViewController class]];
        
        //always at the very bottom
        subject.view should_not be_nil;
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
        
        describe(@"-numberOfSectionsInTableView:", ^{
            it(@"should return 2 sections", ^{
                [subject numberOfSectionsInTableView:subject.tableView] should equal(2);
            });
        });
        
        describe(@"-tableview:numberOfRowsInSection:", ^{
            context(@"1st section", ^{
                it(@"should return 2", ^{
                    [subject.tableView.dataSource tableView:subject.tableView numberOfRowsInSection:0] should equal(2);
                  
                });
            });
            
            context(@"2nd section", ^{
                it(@"should return 3", ^{
                    [subject.tableView.dataSource tableView:subject.tableView numberOfRowsInSection:1] should equal(3);
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
                    cell = (MainCardViewCell *)[subject tableView:subject.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
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
        
        describe(@"-tableView:didSelectRowAtIndexPath", ^{
            __block NSIndexPath *indexPath;
            __block MainCardViewCell *cell;
            
            subjectAction(^{
                [subject tableView:subject.tableView didSelectRowAtIndexPath:indexPath];
                
                //let's pop an alert-view.
                [alert addAction:someAction];
                [subject presentViewController:alert animated:YES completion:nil];
            });
            
            context(@"a row from the first-section being selected", ^{
                beforeEach(^{
                    //for the subject action we set the following values
                    indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
                    cell.employee = employee1;
                    subject.tableView stub_method(@selector(cellForRowAtIndexPath:)).with(indexPath).and_return(cell);
                    spy_on(subject.tableView);
                });
                
                it(@"should pops an alertView/controller", ^{
                    subject.navigationController.topViewController should be_same_instance_as(alert);
                });
            });
            
            context(@"a row from the second-section being selected", ^{
                beforeEach(^{
                    //for the subject action we set the following values
                    indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
                    cell.employee = employee1;
                    subject.tableView stub_method(@selector(cellForRowAtIndexPath:)).with(indexPath).and_return(cell);
                     spy_on(subject.tableView);
                });
                
                it(@"should pops an alertView", ^{
                    subject.navigationController.topViewController should be_same_instance_as(alert);
                });
            });
        });
    });
});

SPEC_END
