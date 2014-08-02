//
//  ConnectionsViewController.m
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "ConnectionsViewController.h"

@interface ConnectionsViewController ()

@end

@implementation ConnectionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	_appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//	[_appDelegate.multipeerManager setupPeerAndSessionWithDisplayName:_appDelegate.userInformation.userName];
//    [_appDelegate.multipeerManager setupMCBrowser];
//	[_appDelegate.multipeerManager advertiseSelf:defaultVisibility];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(peerDidChangeStateNotification:) name:@"LibMate_MCDidChangeStateNotification" object:nil];
	
	_arrConnectedDevices = [[NSMutableArray alloc] initWithArray:_appDelegate.multipeerManager.session.connectedPeers];
    
    NSLog(@"Connected Peers: %u", _arrConnectedDevices.count);
	
	[_tblConnectedDevices setDelegate:self];
	[_tblConnectedDevices setDataSource:self];
    [_tblConnectedDevices reloadData];
    
    _lblDeviceName.text = _appDelegate.userInformation.userName;
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

- (void)browseForDevices:(id)sender {
	[_appDelegate.multipeerManager setupMCBrowser];
	[_appDelegate.multipeerManager.browser setDelegate:self];
	[self presentViewController:_appDelegate.multipeerManager.browser animated:YES completion:nil];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
	[_appDelegate.multipeerManager.browser dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
	[_appDelegate.multipeerManager.browser dismissViewControllerAnimated:YES completion:nil];
}

- (void)peerDidChangeStateNotification:(NSNotification *)notification {
	MCPeerID *peerID = [notification.userInfo objectForKey:@"peerID"];
	NSString *peerDisplayName = peerID.displayName;
	
	MCSessionState state = [[notification.userInfo objectForKey:@"state"] intValue];
	
	if (state != MCSessionStateConnecting) {
		if (state == MCSessionStateConnected) {
			[_arrConnectedDevices addObject:peerDisplayName];
		}
		else {
			if (_arrConnectedDevices.count > 0) {
				[_arrConnectedDevices removeObjectAtIndex:[_arrConnectedDevices indexOfObject:peerDisplayName]];
			}
		}
		
		[_tblConnectedDevices reloadData];
		
		BOOL peerExist = ([_appDelegate.multipeerManager.session.connectedPeers count] > 0);
		[_btnDisconnect setEnabled:peerExist];
	}
    
    NSLog(@"Connected Peers: %u", _appDelegate.multipeerManager.session.connectedPeers.count);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_arrConnectedDevices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifer"];
	}
	
	[[cell textLabel] setText:[_arrConnectedDevices objectAtIndex:[indexPath row]]];
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 60.0;
}

- (IBAction)disconnect:(id)sender {
	[_appDelegate.multipeerManager.session disconnect];
	
	[_arrConnectedDevices removeAllObjects];
	
	[_tblConnectedDevices reloadData];
}

@end
