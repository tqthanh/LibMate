//
//  ConnectionsViewController.h
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

#import "AppDelegate.h"

@interface ConnectionsViewController : UIViewController <MCBrowserViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

#define defaultVisibility TRUE

@property (weak, nonatomic) IBOutlet UILabel *lblDeviceName;
@property (weak, nonatomic) IBOutlet UITableView *tblConnectedDevices;
@property (weak, nonatomic) IBOutlet UIButton *btnDisconnect;

@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NSMutableArray *arrConnectedDevices;

- (IBAction)browseForDevices:(id)sender;
- (IBAction)disconnect:(id)sender;
- (void)peerDidChangeStateNotification:(NSNotification *)notification;

@end
