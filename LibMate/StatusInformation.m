//
//  StatusInformation.m
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "StatusInformation.h"

@implementation StatusInformation

- (id)init {
	if (self = [super init]) {
		_author = nil;
		_image = nil;
		_description = nil;
		_hashTags = [[NSMutableArray alloc] init];
	}
	return self;
}

- (id)initWithAuthor:(NSString *)author image:(UIImage *)image description:(NSString *)description hashTags:(NSMutableArray *)hashTags {
	if (self = [super init]) {
		_author = author;
		_image = image;
		_description = description;
		_hashTags = hashTags;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		_author = [aDecoder decodeObjectForKey:@"author"];
		_image = [aDecoder decodeObjectForKey:@"image"];
		_description = [aDecoder decodeObjectForKey:@"description"];
		_hashTags = [aDecoder decodeObjectForKey:@"hashTags"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.author forKey:@"author"];
	[aCoder encodeObject:self.image forKey:@"image"];
	[aCoder encodeObject:self.description forKey:@"description"];
	[aCoder encodeObject:self.hashTags forKey:@"hashTags"];
}

- (NSInteger)countMatchTags:(StatusInformation *)aInformation {
	NSMutableSet *myTags = [[NSMutableSet alloc] initWithArray:_hashTags];
	NSSet *aTags = [[NSSet alloc] initWithArray:aInformation.hashTags];
	[myTags intersectSet:aTags];
	
	return myTags.count;
}

- (NSArray *)getSortedMatchTags:(NSArray *)aInformations {
	NSArray *result = [aInformations sortedArrayUsingComparator:^NSComparisonResult(StatusInformation *a, StatusInformation *b) {
		return [self countMatchTags:a] > [self countMatchTags:b];
	} ];
	return result;
}

@end
