//
//  MessageInformation.m
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "MessageInformation.h"

@implementation MessageInformation

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
        _author = [aDecoder decodeObjectForKey:@"author"];
		_content = [aDecoder decodeObjectForKey:@"content"];
		_arrReceivers = [aDecoder decodeObjectForKey:@"arrReceivers"];
	}
	return self;
}

- (id)initWithAuthor:(NSString *)author content:(NSString *)content receivers:(NSArray *)arrReceivers {
    if (self = [super init]) {
        _author = author;
        _content = content;
        _arrReceivers = arrReceivers;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.author forKey:@"author"];
	[aCoder encodeObject:self.content forKey:@"content"];
	[aCoder encodeObject:self.arrReceivers forKey:@"arrReceivers"];
}

@end
