//
//  FindMateViewController.h
//  LibMate
//
//  Created by TQThanh on 8/2/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ClientManager.h"
@interface FindMateViewController : UIViewController <ClientManagerStatusDelegate,UITableViewDataSource,
UITableViewDelegate>

@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong,nonatomic) ClientManager *clientManager;
@property (weak, nonatomic) IBOutlet UITableView *MateTable;


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
