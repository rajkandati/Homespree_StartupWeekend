//
//  HSConsumerProjectsViewController.h
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface HSConsumerProjectsViewController : UIViewController <UITabBarControllerDelegate, UITableViewDataSource>

@property(nonatomic, strong) User *user;

@end
