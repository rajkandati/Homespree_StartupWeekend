//
//  HSConsumerProjectsViewController.m
//  HomeSpree
//
//  Created by Raj Kandathi on 1/26/13.
//  Copyright (c) 2013 Raj K. All rights reserved.
//

#import "HSConsumerProjectsViewController.h"
#import "EventTableViewCell.h"
#import "Project.h"
#import "BidsViewController.h"

static NSString *const NothingFoundCellIdentifier = @"NothingFoundCell";


@interface HSConsumerProjectsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HSConsumerProjectsViewController

@synthesize tableView = _tableView;
@synthesize user = _user;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:@"EventTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"ProjectTableViewCell"];
    self.tableView.rowHeight = 120;
    
    cellNib = [UINib nibWithNibName:NothingFoundCellIdentifier bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:NothingFoundCellIdentifier];
}

# pragma UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.user.projects == nil || self.user.projects.count == 0) {
        return 1;
    } else {
        return self.user.projects.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%i", self.user.projects.count);
    if (self.user.projects == nil || self.user.projects.count == 0) {
        return [tableView dequeueReusableCellWithIdentifier:NothingFoundCellIdentifier];
    } else {
        EventTableViewCell *eventCell = [tableView dequeueReusableCellWithIdentifier:@"ProjectTableViewCell" ];
        Project *project = [self.user.projects objectAtIndex:indexPath.row];
        eventCell.eventNameLabel.text = project.projectCategory;
        eventCell.eventTimeLabel.text = [NSString stringWithFormat:@"%@", project.endDate];
        eventCell.eventImageView.image = [UIImage imageWithData:project.image];
        return eventCell;
    }
}

# pragma UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BidsViewController *bvc = [self.storyboard instantiateViewControllerWithIdentifier:@"BidsViewController"];
    //BidsViewController *bvc = [[BidsViewController alloc] init];
    [self.navigationController pushViewController:bvc animated:YES];
}



@end
