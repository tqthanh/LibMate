//
//  StatusInformation.h
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusInformation : NSObject <NSCoding>

@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSMutableArray *hashTags;

- (id) initWithAuthor:(NSString *)author image:(UIImage *)image description:(NSString *)description hashTags:(NSMutableArray *)hashTags;

@end
