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

-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress{
    
    NSDictionary *dict = @{@"resourceName"  :   resourceName,
                           @"peerID"        :   peerID,
                           @"progress"      :   progress
                           };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LibMate_MCDidStartReceivingResourceNotification"
                                                        object:nil
                                                      userInfo:dict];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [progress addObserver:self
                   forKeyPath:@"fractionCompleted"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    });
}

- (void)session:(MCSession *)session didReceiveCertificate:(NSArray *)certificate fromPeer:(MCPeerID *)peerID certificateHandler:(void (^)(BOOL))certificateHandler {
    return certificateHandler(YES);
}

-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error{
    
    NSDictionary *dict = @{@"resourceName"  :   resourceName,
                           @"peerID"        :   peerID,
                           @"localURL"      :   localURL
                           };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LibMate_didFinishReceivingResourceNotification"
                                                        object:nil
                                                      userInfo:dict];
    
}


-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID{
    
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
