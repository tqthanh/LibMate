//
//  AppDelegate.h
//  LibMate
//
//  Created by TQThanh on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserInformation.h"
#import "MultipeerManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(strong, nonatomic) UIWindow *window;

@property(strong, nonatomic) UserInformation *userInformation;
@property(strong,nonatomic) MultipeerManager *multipeerManager;


@end
