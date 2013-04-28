//
//  ProjectDetailsViewController.h
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectCategoryPickerViewController.h"
#import "EventDateTimePickerTableViewController.h"
#import "User.h"


@interface ProjectDetailsViewController : UIViewController <ProjectCategoryPickerViewControllerDelegate, EventDateTimePickerTableViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(nonatomic, strong) User *user;

@end
