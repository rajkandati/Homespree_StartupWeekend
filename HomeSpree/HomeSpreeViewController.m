//
//  HomeSpreeViewController.m
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import "HomeSpreeViewController.h"
#import "User.h"
#import "HSConsumerProjectsViewController.h"
#import "AddProjectViewController.h"

@interface HomeSpreeViewController ()

@property(nonatomic, strong) User *user;

@end

@implementation HomeSpreeViewController

@synthesize user = _user;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowProjects"]) {
        UINavigationController *navC = segue.destinationViewController;
        HSConsumerProjectsViewController *hsCPV = (HSConsumerProjectsViewController*)navC.topViewController;
        hsCPV.user = self.user;
    } else if ([segue.identifier isEqualToString:@"AddProject"]) {
        UINavigationController *navC = segue.destinationViewController;
        AddProjectViewController *addPVC = (AddProjectViewController*)navC.topViewController;
        addPVC.user = self.user;
    }
}

- (User*)user
{
    //TODO: Check in defaults
    if (!_user) {
        _user = [[User alloc] init];
    }
    return _user;
}

- (void)segueToNewScreen
{
    if (self.user.projects == nil || self.user.projects.count == 0) {
        [self performSegueWithIdentifier:@"AddProject" sender:nil];
    } else {
        [self performSegueWithIdentifier:@"ShowProjects" sender:nil];
    }
}

- (IBAction)homeOwnerButtonTapped {
    self.user.userType = @"HO";
    [self segueToNewScreen];
}

- (IBAction)contractorButtonTapped {
    self.user.userType = @"CO";
    [self segueToNewScreen];
}

@end
