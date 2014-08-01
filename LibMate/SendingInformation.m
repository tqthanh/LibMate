//
//  SendingInformation.m
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "SendingInformation.h"

@implementation SendingInformation

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.dataName = [aDecoder decodeObjectForKey:@"dataName"];
		self.data = [aDecoder decodeObjectForKey:@"data"];
	}
	return self;
}

- (id)initWithMessage:(MessageInformation *)message {
	if (self == [super init]) {
		self.dataName = @"MESSAGE";
		self.data = [NSKeyedArchiver archivedDataWithRootObject:message];
	}
	return self;
}

- (id)initWithStatus:(StatusInformation *)status {
	if (self == [super init]) {
		self.dataName = @"STATUS";
		self.data = [NSKeyedArchiver archivedDataWithRootObject:status];
	}
	return self;
}

- (NSData *)convertToNSData {
	return [NSKeyedArchiver archivedDataWithRootObject:self];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.dataName forKey:@"dataName"];
	[aCoder encodeObject:self.data forKey:@"data"];
}

@end
