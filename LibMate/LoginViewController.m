//
//  ViewController.m
//  LibMate
//
//  Created by TQThanh on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    _appDelegate.userInformation.userName = @"TQThanh";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.UserNameText resignFirstResponder];
}

@end
