//
//  ProjectCategoryPickerViewController.h
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProjectCategoryPickerViewController;

@protocol ProjectCategoryPickerViewControllerDelegate <NSObject>

- (void)projectCategoryPicker:(ProjectCategoryPickerViewController *)pcPVC pickedCategory:(NSString *)category;
- (void)projectCategoryPickerCancelled:(ProjectCategoryPickerViewController *)pcPVC;

@end

@interface ProjectCategoryPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic, weak) id<ProjectCategoryPickerViewControllerDelegate> delegate;

@end
