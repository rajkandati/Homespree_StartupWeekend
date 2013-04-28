//
//  ProjectCategoryPickerViewController.m
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import "ProjectCategoryPickerViewController.h"

@interface ProjectCategoryPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (nonatomic, copy) NSArray *categories;
@property (nonatomic, weak) NSString *categoryPicked;

@end

@implementation ProjectCategoryPickerViewController
@synthesize categoryPicker = _categoryPicker;
@synthesize categories = _categories;
@synthesize delegate = _delegate;


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSArray *)categories
{
    if (!_categories) {
        _categories = [[NSArray alloc] initWithObjects:@"Appliance Repair", @"Building & Construction", @"Carpenting", @"Flooring", @"Painting", @"Roofing", @"Tile & Stone", @"Windows & Doors", nil];
    }
    return _categories;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return self.categories.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [self.categories objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.categoryPicked = [self.categories objectAtIndex:row];
}

- (IBAction)cancelTapped:(id)sender {
    [self.delegate projectCategoryPickerCancelled:self];
}

- (IBAction)doneTapped:(id)sender {
    [self.delegate projectCategoryPicker:self pickedCategory:self.categoryPicked];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
