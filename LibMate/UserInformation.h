//
//  UserInformation.h
//  LibMate
//
//  Created by Bao Truong on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) UIImage *userAvatar;
@property (strong, nonatomic) NSMutableArray *status;

- (id) initWithUserName:(NSString *)userName avatar:(UIImage *)userAvatar status:(NSMutableArray *)status;

@end
