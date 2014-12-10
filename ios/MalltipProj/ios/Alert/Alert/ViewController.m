//
//  ViewController.m
//  Alert
//
//  Created by DP on 9/4/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 1000, 0, 0)];
    [self.view addSubview:self.mainSwitch];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) yesButtonTitle;
{
    return @"Yes";
}

- (NSString *) noButtonTitle;
{
    return @"No";
}

- (IBAction)showAlert:(id)sender;
{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate: nil cancelButtonTitle:@"" otherButtonTitles:@"OK", nil];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Credit Card Number"
                              message:@"Please enter your credit card number:"
                              delegate:self
                              cancelButtonTitle:[self noButtonTitle]
                              otherButtonTitles:[self yesButtonTitle], nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    /* Display a numerical keypad for this text field */
    UITextField *textField = [alertView textFieldAtIndex:0];
    textField.keyboardType = UIKeyboardTypeNumberPad;
    
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:[self yesButtonTitle]]) {
        NSLog(@"User pressed the Yes button");
    } else {
        NSLog(@"User pressed the No button");
    }
}

- (void) switchIsChanged:(UISwitch *)paramSender;
{
    NSLog(@"Sender is = %@", paramSender);
    if ([paramSender isOn]){
        NSLog(@"The switch is turned on.");
    } else {
        NSLog(@"The switch is turned off.");
    }
}
@end
