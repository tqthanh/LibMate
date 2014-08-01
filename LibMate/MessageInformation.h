//
//  MessageInformation.h
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageInformation : NSObject <NSCoding>

@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSArray *arrReceivers;

- (id)initWithAuthor:(NSString *)author content:(NSString *)content receivers:(NSArray *)arrReceivers;

@end
