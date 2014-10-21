//
//  ViewController.m
//  Implementing Controllers Views
//
//  Created by DP on 9/8/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property(nonatomic, strong) UIPickerView *myPicker;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    self.myPicker = [[UIPickerView alloc] init];
    self.myPicker.dataSource = self;
    self.myPicker.delegate = self;
    self.myPicker.showsSelectionIndicator = YES;
    self.myPicker.center = self.view.center;
    [self.view addSubview:self.myPicker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    if ([pickerView isEqual:self.myPicker]){
        return 1;
    }
    return 0;
}

-(NSInteger) pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if ([pickerView isEqual:self.myPicker]){
        return 10;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if([pickerView isEqual:self.myPicker]) {
        return [NSString stringWithFormat:@"Row %ld", (long)row + 1];
    }
    return nil;
}
@end
