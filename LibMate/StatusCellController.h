//
//  StatusCellController.h
//  LibMate
//
//  Created by TQThanh on 8/2/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusCellController : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UITextView *descLable;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@end
