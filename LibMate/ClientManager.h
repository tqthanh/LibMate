//
//  ClientManager.h
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

#import "SendingInformation.h"
#import "MessageInformation.h"
#import "StatusInformation.h"

@protocol ClientManagerMessageDelegate <NSObject>

- (void)didReceiveMessage:(MessageInformation *)message;

@end

@protocol ClientManagerStatusDelegate <NSObject>

- (void)didReceiveStatus:(StatusInformation *)status;

@end

@class AppDelegate;

@interface ClientManager : NSObject

@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NSMutableDictionary *delivered;
@property (strong,nonatomic) NSMutableArray*listStatus;
@property (weak, nonatomic) id<ClientManagerMessageDelegate> delegateMessage;
@property (weak, nonatomic) id<ClientManagerStatusDelegate> delegateStatus;

- (void)didReceiveDataWithNotification:(NSNotification *)notification;
- (void)sendInformation:(SendingInformation *)information receivers:(NSArray *)receivers;
- (void)sendMessage:(MessageInformation *)message;
- (void)postStatus:(StatusInformation *)status;
- (void)transferAllStatus:(MCPeerID *)peerID;
- (void)transferStatus:(StatusInformation *)status peer:(MCPeerID *)peerID;

@end
