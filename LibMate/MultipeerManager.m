//
//  MultipeerManager.m
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "MultipeerManager.h"
#import "AppDelegate.h"

@implementation MultipeerManager

- (id) init {
	self = [super init];
	
	if (self) {
//		_peerID = [[MCPeerID alloc] init];
//		_session = [[MCSession alloc] init];
//		_browser = [[MCBrowserViewController alloc] init];
//		_advertiser = [[MCAdvertiserAssistant alloc] init];
        _peerID = nil;
        _session = nil;
        _browser = nil;
        _advertiser = nil;
		
		_appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	}
	
	return self;
}

- (void)setupPeerAndSessionWithDisplayName:(NSString *)displayName {
	_peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
	
	_session = [[MCSession alloc] initWithPeer:_peerID];
	[_session setDelegate:self];
}

- (void)setupMCBrowser {
	_browser = [[MCBrowserViewController alloc] initWithServiceType:@"chat-files" session:_session];
}

- (void)advertiseSelf:(BOOL)shouldAdvertise {
	if (shouldAdvertise) {
		_advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"chat-files" discoveryInfo:nil session:_session];
		[_advertiser start];
	}
	else {
		[_advertiser stop];
		_advertiser = nil;
	}
}

- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
	NSDictionary *dict = @{@"peerID": peerID,
						   @"state": [NSNumber numberWithInt:state]};
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"LibMate_MCDidChangeStateNotification" object:nil userInfo:dict];
	
	if (state == MCSessionStateConnected) {
		[_appDelegate.clientManager transferAllStatus:peerID];
	}
}

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
	NSDictionary *dict = @{@"peerID": peerID,
						   @"data": data};
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"LibMate_MCDidReceiveDataNotification" object:nil userInfo:dict];
}

@end
