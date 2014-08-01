//
//  SendingInformation.h
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MessageInformation.h"
#import "StatusInformation.h"

@interface SendingInformation : NSObject <NSCoding>

@property (strong, nonatomic) NSString *dataName;
@property (strong, nonatomic) NSData *data;

- (id)initWithMessage:(MessageInformation *)message;
- (id)initWithStatus:(StatusInformation *)status;
- (NSData *)convertToNSData;

@end
