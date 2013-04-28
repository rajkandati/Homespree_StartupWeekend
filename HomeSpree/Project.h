//
//  Project.h
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject

@property(nonatomic, copy) NSString *projectCategory;
@property(nonatomic, copy) NSString *endDate;
@property(nonatomic, strong) NSData *image;

@end
