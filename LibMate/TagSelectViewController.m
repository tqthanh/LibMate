//
//  TagSelectViewController.m
//  LibMate
//
//  Created by TQThanh on 8/1/14.
//  Copyright (c) 2014 TQThanh. All rights reserved.
//

#import "TagSelectViewController.h"

@interface TagSelectViewController ()

@end

@implementation TagSelectViewController
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:self];
    self.TagPicker.delegate = self;
    self.TagPicker.dataSource = self;
    // Do any additional setup after loading the view.
    self.tagArray  = [[NSArray alloc]         initWithObjects:@"Math",@"Physic",@"Chemistry",@"Programming",@"Ios",@"C++" , nil];
    //self.Description.delegate = self;
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xd35400)];
    
    _appDelegate = [[UIApplication sharedApplication] delegate];
    NSLog(@"Connected Peers: %lu\n", [_appDelegate.multipeerManager.session.connectedPeers count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.Description resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return 5;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
     return [self.tagArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    NSLog(@"Selected Row %d", row);
    switch(row)
    {
            
        case 0:
            self.tag = @"Math";
            break;
        case 1:
            self.tag = @"Physic";
            break;
        case 2:
            self.tag = @"Chemistry";
            break;
        case 3:
            self.tag = @"Programming";
            break;
        case 4:
            self.tag = @"Ios";
            break;
        case 5:
            self.tag = @"C++";
            break;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    return YES;
}


- (IBAction)UpdateStatus:(id)sender {
   
    StatusInformation *status = [[StatusInformation alloc] initWithAuthor:_appDelegate.userInformation.userName image:_appDelegate.userInformation.userAvatar description:self.Description.text hashTags:[[NSMutableArray alloc] initWithObjects:self.tag, nil]];
//    NSLog(@"Connected Peers: %u", [_appDelegate.multipeerManager.session.connectedPeers count]);
    [_appDelegate.clientManager postStatus:(status)];
}
@end
