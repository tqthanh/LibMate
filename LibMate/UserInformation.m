//
//  UserInformation.m
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

- (id)init {
	if (self = [super init]) {
		_userName = nil;
		_userAvatar = nil;
		_status = [[NSMutableArray alloc] init];
	}
	return self;
}

- (id)initWithUserName:(NSString *)userName avatar:(UIImage *)userAvatar status:(NSMutableArray *)status {
	if (self = [super init]) {
		_userName = userName;
		_userAvatar = userAvatar;
		_status = status;
	}
	return self;
}

@end
