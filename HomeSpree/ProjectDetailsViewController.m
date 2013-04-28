//
//  ProjectDetailsViewController.m
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import "ProjectDetailsViewController.h"
#import "EventDateTimePickerTableViewController.h"
#import "Project.h"
#import "HSConsumerProjectsViewController.h"

@interface ProjectDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *categoryButton;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (strong, nonatomic) UIImagePickerController *imgPicker;
@property(nonatomic, copy) NSString *category;
@property(nonatomic, copy) NSString *endDate;
@property(nonatomic, strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *progressBarImage;
@property (weak, nonatomic) IBOutlet UIImageView *categoryPickedImage;

@property (weak, nonatomic) IBOutlet UIImageView *detailsPickedImage;
@property (weak, nonatomic) IBOutlet UIImageView *datePickedImage;
@property (weak, nonatomic) IBOutlet UIImageView *picturePickedImage;
@property (nonatomic, weak) UIImage *checkImage;

@end

@implementation ProjectDetailsViewController
@synthesize categoryButton = _categoryButton;
@synthesize dateButton = _dateButton;
@synthesize imgPicker = _imgPicker;
@synthesize user = _user;
@synthesize category = _category;
@synthesize image = _image;
@synthesize progressBarImage = _progressBarImage;
@synthesize checkImage = _checkImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imgPicker = [[UIImagePickerController alloc] init];
    self.imgPicker.delegate = self;
    self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    UIImage *prgImg = [UIImage imageNamed:@"TRACK BAR 0"];
    self.progressBarImage.image = prgImg;
    
    self.checkImage = [UIImage imageNamed:@"check"];
    
}

- (IBAction)addImage:(id)sender {
    [self presentViewController:self.imgPicker animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickCategory"]) {
        ProjectCategoryPickerViewController *pcPVC = (ProjectCategoryPickerViewController*)segue.destinationViewController;
        pcPVC.delegate = self;
    } else if ([segue.identifier isEqualToString:@"PickDate"]) {
        UINavigationController *uiNavC = segue.destinationViewController;
        EventDateTimePickerTableViewController *eventDatePicker = (EventDateTimePickerTableViewController *)uiNavC.topViewController;
        eventDatePicker.delegate = self;
    } else if ([segue.identifier isEqualToString:@"ShowProjects"]) {
        UINavigationController *uiNav = segue.destinationViewController;
        HSConsumerProjectsViewController *projectsVC = (HSConsumerProjectsViewController*)uiNav.topViewController;
        projectsVC.user = self.user;
    }
}

- (void)projectCategoryPicker:(ProjectCategoryPickerViewController *)pcPVC pickedCategory:(NSString *)category
{
    [self dismissViewControllerAnimated:YES completion:^{
        self.categoryButton.titleLabel.text = category;
        self.category = category;
        self.categoryPickedImage.image = self.checkImage;
    }];
}

- (void)projectCategoryPickerCancelled:(ProjectCategoryPickerViewController *)pcPVC
{
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (void)eventDateTimePickerTableViewControllerDidCancel:(EventDateTimePickerTableViewController *)eventDateTimePickerTableViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)eventDateTimePickerTableViewController:(EventDateTimePickerTableViewController *)eventDateTimePickerTableViewController
                          didPickStartDateTime:(NSString *)startDateTimeString
                                andEndDateTime: (NSString *)endDateTimeString
{
    [self dismissViewControllerAnimated:YES completion:^{
        self.endDate = endDateTimeString;
        self.categoryPickedImage.image = self.checkImage;
        self.datePickedImage.image = self.checkImage;
    }];
}

# pragma UIImagePickerControllerDelegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo
{
    //self.imagePicked = img;
    //self.event.imageData = UIImagePNGRepresentation(img);
    [self dismissViewControllerAnimated:YES completion:^{
        self.image = img;
        self.picturePickedImage.image = self.checkImage;
    }];
}


- (IBAction)createProject:(id)sender
{
    Project *project = [[Project alloc] init];
    project.endDate = self.endDate;
    project.projectCategory = self.category;
    project.image = UIImagePNGRepresentation(self.image);
    [self.user.projects addObject:project];
}

@end
