//
//  MessageViewController.m
//  LibMate
//
//  Created by TQThanh on 8/2/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "MessageViewController.h"

@implementation MessageViewController

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
    [_appDelegate.clientManager setDelegateMessage:self];
    [_tfMessage setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self onSendButtonTouch:self];
    return YES;
}

- (void)onSendButtonTouch:(id)sender {
    [_appDelegate.clientManager sendMessage:[[MessageInformation alloc] initWithAuthor:_appDelegate.userInformation.userName content:_tfMessage.text receivers:_appDelegate.multipeerManager.session.connectedPeers]];
    
    [_tvMessage setText:[_tvMessage.text stringByAppendingString:[NSString stringWithFormat:@"%@ wrote: %@\n", _appDelegate.userInformation.userName, _tfMessage.text]]];
    
    [_tfMessage resignFirstResponder];
}

- (void)didReceiveMessage:(MessageInformation *)message {
    [_tvMessage performSelectorOnMainThread:@selector(setText:) withObject:[_tvMessage.text stringByAppendingString:[NSString stringWithFormat:@"%@ wrote: %@\n", message.author, message.content]] waitUntilDone:NO];
//    [_tvMessage setText:message.description];
}

@end
