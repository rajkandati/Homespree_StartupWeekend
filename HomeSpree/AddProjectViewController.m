//
//  AddProjectViewController.m
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import "AddProjectViewController.h"
#import "ProjectDetailsViewController.h"
#import "HSConsumerProjectsViewController.h"

@interface AddProjectViewController ()

@end

@implementation AddProjectViewController

@synthesize user;


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ProjectDetails"]) {
        ProjectDetailsViewController *pDVC = segue.destinationViewController;
        pDVC.user = self.user;
    }
}

@end
