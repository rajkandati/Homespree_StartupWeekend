//
//  EventDateTimePickerTableViewController.m
//  Blastt
//
//  Created by Raj Kandathi on 12/10/12.
//  Copyright (c) 2012 Raj K. All rights reserved.
//

#import "EventDateTimePickerTableViewController.h"

@interface EventDateTimePickerTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *eventEndTimeLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *eventDateTimePicker;
@property (nonatomic) int selectedTableCell;

@end

@implementation EventDateTimePickerTableViewController
@synthesize eventEndTimeLabel = _eventEndTimeLabel;
@synthesize eventDateTimePicker = _eventDateTimePicker;
@synthesize selectedTableCell = _selectedTableCell;

- (IBAction)cancelTapped:(id)sender {
    [self.delegate eventDateTimePickerTableViewControllerDidCancel:self];
}

- (IBAction)doneTapped:(id)sender {
    [self.delegate eventDateTimePickerTableViewController:self didPickStartDateTime:nil andEndDateTime:self.eventEndTimeLabel.text];
}

- (NSString *)getFormattedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    //[formatter setTimeStyle:NSDateFormatterMediumStyle];
    return [formatter stringFromDate:self.eventDateTimePicker.date];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.eventEndTimeLabel.text = [self getFormattedDate];
}


- (IBAction)eventDateChanged:(UIDatePicker *)sender
{
    self.eventEndTimeLabel.text = [self getFormattedDate];
}

- (IBAction)done:(UIBarButtonItem *)sender
{
    [self.delegate eventDateTimePickerTableViewController:self
                                     didPickStartDateTime:nil
                                           andEndDateTime:self.eventEndTimeLabel.text];
}

#pragma UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedTableCell = indexPath.row;
}

- (void)didReceiveMemoryWarning
{
    self.eventDateTimePicker = nil;
    self.eventEndTimeLabel = nil;
    [super didReceiveMemoryWarning];
}

@end
