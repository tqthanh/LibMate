//
//  ClientManager.m
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "ClientManager.h"

@implementation ClientManager

- (id)init {
	self = [super init];
	
	if (self) {
		_appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
		_delegate = nil;
		_delivered = [[NSMutableSet alloc] init];
	}
	
	return self;
}

- (void)didReceiveDataWithNotification:(NSNotification *)notification {
	NSData *receiveData = [notification.userInfo objectForKey:@"data"];
	SendingInformation *receiveInformation = [NSKeyedUnarchiver unarchiveObjectWithData:receiveData];
	
	if ([receiveInformation.dataName isEqual:@"MESSAGE"]) {
		MessageInformation *message = [NSKeyedUnarchiver unarchiveObjectWithData:receiveInformation.data];
		[_delegate didReceiveMessage:message];
		
		//
		NSMutableSet *myPeers = [NSMutableSet setWithArray:_appDelegate.multipeerManager.session.connectedPeers];
		NSSet *sendPeers = [NSSet setWithArray:message.arrReceivers];
		[myPeers intersectSet:sendPeers];
		
		[self sendInformation:receiveInformation receivers:[myPeers allObjects]];
	}
	else {
		StatusInformation *status = [NSKeyedUnarchiver unarchiveObjectWithData:receiveInformation.data];
		[_delegate didReceiveStatus:status];
		
		[self sendInformation:receiveInformation receivers:_appDelegate.multipeerManager.session.connectedPeers];
	}
}

- (void)sendInformation:(SendingInformation *)information receivers:(NSArray *)receivers {
	if ([_delivered containsObject:information]) {
		return;
	}
	
	[_delivered addObject:information];
	
	NSData *sendingData = [information convertToNSData];
	NSError *error;

	[_appDelegate.multipeerManager.session sendData:sendingData toPeers:receivers withMode:MCSessionSendDataReliable error:&error];
}

- (void)sendMessage:(MessageInformation *)message {
	SendingInformation *sendingInformation;
	sendingInformation = [sendingInformation initWithMessage:message];
	
	[self sendInformation:sendingInformation receivers:message.arrReceivers];
}

-(void)postStatus:(StatusInformation *)status {
	SendingInformation *sendingInformation;
	sendingInformation = [sendingInformation initWithStatus:status];
	
	[self sendInformation:sendingInformation receivers:_appDelegate.multipeerManager.session.connectedPeers];
}

@end