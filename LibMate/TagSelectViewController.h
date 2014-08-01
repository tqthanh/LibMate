//
//  TagSelectViewController.h
//  LibMate
//
//  Created by TQThanh on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagSelectViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextView *Description;
@property (weak, nonatomic) IBOutlet UIPickerView *TagPicker;
@property (strong, nonatomic) NSArray *tagArray;
@property (weak, nonatomic) IBOutlet UINavigationBar *NavBar;
@property (strong, nonatomic) NSString *tag;
- (IBAction)UpdateStatus:(id)sender;

@end

@protocol UIPickerViewDataSource
@required

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component;
@end