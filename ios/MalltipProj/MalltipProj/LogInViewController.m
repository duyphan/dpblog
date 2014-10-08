//
//  LogInViewController.m
//  MalltipProj
//
//  Created by DP on 10/2/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "LogInViewController.h"
#import "SearchViewController.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface LogInViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageLogoLoginView;
@property (weak, nonatomic) IBOutlet UIImageView *imageIconOptionLoginView;
@property (weak, nonatomic) IBOutlet UIView *viewTextEmailAddressLoginView;
@property (weak, nonatomic) IBOutlet UITextField *textEmailAddressLoginView;
@property (weak, nonatomic) IBOutlet UIView *viewTextPasswordLoginView;
@property (weak, nonatomic) IBOutlet UITextField *textPasswordLoginView;
@property (weak, nonatomic) IBOutlet UIButton *buttonLoginLoginView;
@property (weak, nonatomic) IBOutlet UIButton *buttonResetPasswordLoginView;
@property (weak, nonatomic) IBOutlet UILabel *labeHaveNotAccount;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignUpLoginView;
- (IBAction)performButtonLogin:(id)sender;

- (IBAction)closeLoginView:(id)sender;

@end

@implementation LogInViewController

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
    self.viewTextEmailAddressLoginView.layer.cornerRadius = 5;
    self.viewTextEmailAddressLoginView.clipsToBounds = YES;
    
    self.viewTextPasswordLoginView.layer.cornerRadius = 5;
    self.viewTextPasswordLoginView.clipsToBounds = YES;
    
    self.buttonLoginLoginView.layer.cornerRadius = 5;
    self.buttonLoginLoginView.clipsToBounds = YES;
    
    self.buttonSignUpLoginView.layer.cornerRadius = 5;
    self.buttonSignUpLoginView.clipsToBounds = YES;
    
    self.textEmailAddressLoginView.delegate = self;
    self.textPasswordLoginView.delegate = self;
    
    // Hide keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
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

- (void)dismissKeyboard;
{
    [self.textEmailAddressLoginView resignFirstResponder];
    [self.textPasswordLoginView resignFirstResponder];
}

- (void) handleWhenKeyboardShow:(NSNotification *)paramNotification;
{
    // Add button Sign Up to keyboard
    UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    signUpButton.frame = CGRectMake(0, 163, 106, 53);
    signUpButton.adjustsImageWhenHighlighted = NO;
    [signUpButton setImage:[UIImage imageNamed:@"button_login_keyboard.png"] forState:UIControlStateNormal];
    [signUpButton setImage:[UIImage imageNamed:@"button_login_keyboard.png"] forState:UIControlStateHighlighted];
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
    [self performSelector:@selector(transformViewUp:) withObject:self.textEmailAddressLoginView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.textPasswordLoginView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.viewTextEmailAddressLoginView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.viewTextPasswordLoginView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.buttonLoginLoginView afterDelay:0];
    [self performSelector:@selector(hideLogoAndButtonSignUp) withObject:nil afterDelay:0.1];
    [self performSelector:@selector(zoomViewOut:) withObject:self.imageLogoLoginView afterDelay:0.3];
}

- (void) handleWhenKeyboardHide:(NSNotification *)paramSender;
{
    [self performSelector:@selector(transformViewDown:) withObject:self.textEmailAddressLoginView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.textPasswordLoginView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.viewTextEmailAddressLoginView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.viewTextPasswordLoginView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.buttonLoginLoginView afterDelay:0];
    [self performSelector:@selector(showLogoAndButtonSignUp) withObject:nil afterDelay:0.5];
    [self performSelector:@selector(zoomViewIn:) withObject:self.imageLogoLoginView afterDelay:0.3];
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

- (void)showLogoAndButtonSignUp;
{
    self.imageIconOptionLoginView.hidden = NO;
    self.labeHaveNotAccount.hidden = NO;
    self.buttonSignUpLoginView.hidden = NO;
    self.buttonResetPasswordLoginView.hidden = NO;
}

- (void)hideLogoAndButtonSignUp;
{
    self.imageIconOptionLoginView.hidden = YES;
    self.labeHaveNotAccount.hidden = YES;
    self.buttonSignUpLoginView.hidden = YES;
    self.buttonResetPasswordLoginView.hidden = YES;
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

- (void)performStartSearchViewController;
{
    if ([self stringIsValidEmail:self.textEmailAddressLoginView.text] &&
        ![self.textPasswordLoginView.text isEqualToString:@""] &&
        [self.textEmailAddressLoginView.text isEqualToString:@"duy.phan@asnet.com.vn"] &&
        [self.textPasswordLoginView.text isEqualToString:@"duyphan"]) {
        
        SearchViewController *homeTabBarView = [self.storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
        [self presentViewController:homeTabBarView animated:YES completion:nil];
        
    } else {
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter email and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [error show];
    }
}

- (BOOL)stringIsValidEmail:(NSString *)checkString;
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (IBAction)performButtonLogin:(id)sender;
{
    if ([self stringIsValidEmail:self.textEmailAddressLoginView.text] &&
        ![self.textPasswordLoginView.text isEqualToString:@""] &&
        [self.textEmailAddressLoginView.text isEqualToString:@"duy.phan@asnet.com.vn"] &&
        [self.textPasswordLoginView.text isEqualToString:@"duyphan"]) {
        
        SearchViewController *homeTabBarView = [self.storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
        [self presentViewController:homeTabBarView animated:YES completion:nil];
        
    } else {
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter email and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [error show];
    }
}

- (IBAction)closeLoginView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
