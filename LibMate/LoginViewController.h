//
//  ViewController.h
//  LibMate
//
//  Created by TQThanh on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *UserNameText;
@property (strong, nonatomic) AppDelegate *appDelegate;

@end
