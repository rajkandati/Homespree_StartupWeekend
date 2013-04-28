//
//  User.h
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic, copy) NSString *userType;
@property(nonatomic, copy) NSMutableArray *projects;

@end
