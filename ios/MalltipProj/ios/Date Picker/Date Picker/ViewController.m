//
//  ViewController.m
//  Date Picker
//
//  Created by DP on 9/8/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDatePicker *myDatePicker;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myDatePicker = [[UIDatePicker alloc] init];
    self.myDatePicker.center = self.view.center;
    self.myDatePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:self.myDatePicker];
    
    [self.myDatePicker addTarget:self action:@selector(datePickerDateChanged:) forControlEvents:UIControlEventValueChanged];
    
    NSTimeInterval oneYearTime = 365 * 24 * 60 * 60;
    NSDate *todayDate = [NSDate date];
    NSDate *oneYearFromToday = [todayDate dateByAddingTimeInterval:oneYearTime];
    NSDate *twoYearsFromToday = [todayDate dateByAddingTimeInterval:2 * oneYearTime];
    self.myDatePicker.minimumDate = oneYearFromToday;
    self.myDatePicker.maximumDate = twoYearsFromToday;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)datePickerDateChanged:(UIDatePicker *)paramDatePicker;
{
    if([paramDatePicker isEqual:self.myDatePicker]) {
        NSLog(@"Selected date = %@", paramDatePicker.date);
    }
}

@end
