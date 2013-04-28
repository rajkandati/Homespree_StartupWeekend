//
//  Project.m
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import "Project.h"

@implementation Project

@synthesize projectCategory = _projectCategory;
@synthesize endDate = _endDate;
@synthesize image = _image;

-(NSData *)image
{
    if (!_image) {
        _image = [[NSData alloc] init];
    }
    return _image;
}

@end
