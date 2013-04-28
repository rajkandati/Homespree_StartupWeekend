//
//  User.m
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize userType = _userType;
@synthesize projects = _projects;

- (NSMutableArray *)projects
{
    if (!_projects) {
        _projects = [[NSMutableArray alloc] init];
    }
    return _projects;
}

@end
