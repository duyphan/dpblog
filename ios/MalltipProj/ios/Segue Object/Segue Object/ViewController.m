//
//  ViewController.m
//  Segue Object
//
//  Created by DP on 9/17/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"First Screen";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    return YES;
}

- (void)displayTextIsRequired;
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please enter some text in the text field" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender;
{
    if([identifier isEqualToString:@"pushSecondViewController"]) {
        [self displayTextIsRequired];
        return NO;
    }
    
    return YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
{
    if([segue.identifier isEqualToString:@"pushSecondViewController"]) {
        SecondViewController *nextController = segue.destinationViewController;
        [nextController setText:self.textField.text];
//        [nextController setText:self.textField.text];
    }
}
@end
