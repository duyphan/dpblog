//
//  ResetPasswordViewController.m
//  MalltipProj
//
//  Created by DP on 10/2/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ResetPasswordViewController.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface ResetPasswordViewController ()
- (IBAction)buttonCloseResetPasswordView:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageIconOptionResetPasswordView;
@property (weak, nonatomic) IBOutlet UIImageView *imageLogoResetPasswordView;
@property (weak, nonatomic) IBOutlet UILabel *labelEnterEmailResetPasswordView;
@property (weak, nonatomic) IBOutlet UILabel *labelPasswordReset;
@property (weak, nonatomic) IBOutlet UIView *viewTextEmailResetPasswordView;
@property (weak, nonatomic) IBOutlet UITextField *textEmailResetPasswordView;
@property (weak, nonatomic) IBOutlet UIButton *buttonSubmitResetPasswordView;

@end

@implementation ResetPasswordViewController

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
    
    // Custom UI
    self.viewTextEmailResetPasswordView.layer.cornerRadius = 5;
    self.viewTextEmailResetPasswordView.clipsToBounds = YES;
    
    self.buttonSubmitResetPasswordView.layer.cornerRadius = 5;
    self.buttonSubmitResetPasswordView.clipsToBounds = YES;
    
    self.textEmailResetPasswordView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated;
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated;
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(handleWhenKeyboardShow:)
                   name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(handleWhenKeyboardHide:)
                   name:UIKeyboardWillHideNotification object:nil];
}

- (void) handleWhenKeyboardShow:(NSNotification *)paramNotification;
{
    // Add button Sign Up to keyboard
    UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    signUpButton.frame = CGRectMake(0, 163, 106, 53);
    signUpButton.adjustsImageWhenHighlighted = NO;
    [signUpButton setImage:[UIImage imageNamed:@"button_submit_keyboard.png"] forState:UIControlStateNormal];
    [signUpButton setImage:[UIImage imageNamed:@"button_submit_keyboard.png"] forState:UIControlStateHighlighted];
    [signUpButton addTarget:self action:@selector(performStartSearchViewController) forControlEvents:UIControlEventTouchUpInside];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIView *keyboardView = [[[[[UIApplication sharedApplication] windows] lastObject] subviews] firstObject];
            [signUpButton setFrame:CGRectMake(244, keyboardView.frame.size.height - 42, 72, 38)];
            [keyboardView addSubview:signUpButton];
            [keyboardView bringSubviewToFront:signUpButton];
            
            [UIView animateWithDuration:[[paramNotification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]-.02
                                  delay:.0
                                options:[[paramNotification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]
                             animations:^{
                                 self.view.frame = CGRectOffset(self.view.frame, 0, 0);
                             } completion:nil];
        });
    } else {
        // locate keyboard view
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
            UIView* keyboard;
            for(int i=0; i<[tempWindow.subviews count]; i++) {
                keyboard = [tempWindow.subviews objectAtIndex:i];
                if([[keyboard description] hasPrefix:@"UIKeyboard"])
                    [keyboard addSubview:signUpButton];
            }
        });
    }
    
    // Animation
    [self performSelector:@selector(transformViewUp:) withObject:self.textEmailResetPasswordView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.viewTextEmailResetPasswordView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.labelEnterEmailResetPasswordView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.labelPasswordReset afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.buttonSubmitResetPasswordView afterDelay:0];
    [self performSelector:@selector(hideLogoOption) withObject:nil afterDelay:0.1];
    [self performSelector:@selector(zoomViewOut:) withObject:self.imageLogoResetPasswordView afterDelay:0.3];
}

- (void) handleWhenKeyboardHide:(NSNotification *)paramSender;
{
    [self performSelector:@selector(transformViewDown:) withObject:self.textEmailResetPasswordView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.viewTextEmailResetPasswordView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.labelEnterEmailResetPasswordView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.labelPasswordReset afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.buttonSubmitResetPasswordView afterDelay:0];
    [self performSelector:@selector(showLogoOption) withObject:nil afterDelay:0.5];
    [self performSelector:@selector(zoomViewIn:) withObject:self.imageLogoResetPasswordView afterDelay:0.3];
}

- (void)transformViewUp:(UIView *)myView;
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -100);
    myView.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

- (void)transformViewDown:(UIView *)myView;
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 0);
    myView.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

- (void)zoomViewOut:(UIView *)myView;
{
    // Setup the animation
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeScale(0.7,0.7);
    myView.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
    
}

- (void)zoomViewIn:(UIView *)myView;
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    //[UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeScale(1,1);
    myView.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

- (void)showLogoOption;
{
    self.imageIconOptionResetPasswordView.hidden = NO;
}

- (void)hideLogoOption;
{
    self.imageIconOptionResetPasswordView.hidden = YES;
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

- (IBAction)buttonCloseResetPasswordView:(id)sender;
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)performStartSearchViewController;
{
}
@end
