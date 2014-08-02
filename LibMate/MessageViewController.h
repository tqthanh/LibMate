//
//  MessageViewController.h
//  LibMate
//
//  Created by TQThanh on 8/2/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

@interface MessageViewController : UIViewController <UITextFieldDelegate, ClientManagerMessageDelegate>

@property (weak, nonatomic) IBOutlet UITextView *tvMessage;
@property (weak, nonatomic) IBOutlet UITextField *tfMessage;

@property (strong, nonatomic) AppDelegate *appDelegate;

- (IBAction)onSendButtonTouch:(id)sender;

@end
