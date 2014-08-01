//
//  ClientManager.h
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"
#import "SendingInformation.h"
#import "MessageInformation.h"
#import "StatusInformation.h"

@protocol ClientManagerDelegate <NSObject>

- (void)didReceiveMessage:(MessageInformation *)message;
- (void)didReceiveStatus:(StatusInformation *)status;

@end

@interface ClientManager : NSObject

@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NSMutableSet *delivered;
@property (weak, nonatomic) id<ClientManagerDelegate> delegate;

- (void)didReceiveDataWithNotification:(NSNotification *)notification;
- (void)sendInformation:(SendingInformation *)information receivers:(NSArray *)receivers;
- (void)sendMessage:(MessageInformation *)message;
- (void)postStatus:(StatusInformation *)status;

@end
