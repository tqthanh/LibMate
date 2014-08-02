//
//  FindMateViewController.m
//  LibMate
//
//  Created by TQThanh on 8/2/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "FindMateViewController.h"

@interface FindMateViewController ()

@end

@implementation FindMateViewController

NSMutableArray* statusData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        statusData = [[NSMutableArray alloc] init];
        
        // Mock data
        for (int i = 0; i < 5; ++i)
        {
            StatusInformation* tmp = [[StatusInformation alloc] initWithAuthor:@"author" image:NULL description: @"des" hashTags:NULL];
            [statusData addObject:tmp];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	[_appDelegate.multipeerManager setupPeerAndSessionWithDisplayName:_appDelegate.userInformation.userName];
    [_appDelegate.multipeerManager setupMCBrowser];
	
    
    [self.clientManager setDelegateStatus:self];
    [_MateTable setDelegate:self];
    [_MateTable setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [statusData count];
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//	return 1;
//}
- (void)didReceiveStatus:(StatusInformation *)status {
    UITableViewCell * cell = [[UITableViewCell alloc]init];

    //cell = tableView
    [statusData addObject:status];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifer"];
	}
	StatusInformation* status = [statusData objectAtIndex:[indexPath row]];
	[[cell textLabel] setText:status.author];
    
	return cell;
}

@end
