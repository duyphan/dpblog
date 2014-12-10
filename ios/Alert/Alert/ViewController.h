//
//  ViewController.h
//  Alert
//
//  Created by DP on 9/4/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) UISwitch *mainSwitch;
-(IBAction)showAlert:(id)sender;
-(NSString *)yesButtonTitle;
-(NSString *)noButtonTitle;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end
