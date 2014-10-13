//
//  SignUpViewController.m
//  MalltipProj
//
//  Created by DP on 10/1/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#import "SignUpViewController.h"
#import "SearchViewController.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageLogoSignUpView;
@property (weak, nonatomic) IBOutlet UIImageView *imageIconOption;
@property (weak, nonatomic) IBOutlet UIView *viewTextEmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *textEmailAddress;
@property (weak, nonatomic) IBOutlet UIView *viewTextPassword;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;
@property (weak, nonatomic) IBOutlet UIView *viewTextPasswordConfirm;
@property (weak, nonatomic) IBOutlet UITextField *textPasswordConfirm;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignUpView;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogInView;
@property (weak, nonatomic) IBOutlet UIButton *buttonX;
@property (weak, nonatomic) IBOutlet UILabel *labelSignUp;

- (IBAction)close:(id)sender;
- (IBAction)handleButtonSignUp:(id)sender;
- (IBAction)handleButtonLogin:(id)sender;

- (BOOL)stringIsValidEmail:(NSString *)checkString;
@end

@implementation SignUpViewController

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
    
    self.viewTextEmailAddress.layer.cornerRadius = 5;
    self.viewTextEmailAddress.clipsToBounds = YES;
    
    self.viewTextPassword.layer.cornerRadius = 5;
    self.viewTextPassword.clipsToBounds = YES;
    
    self.viewTextPasswordConfirm.layer.cornerRadius = 5;
    self.viewTextPasswordConfirm.clipsToBounds = YES;
    
    self.buttonSignUpView.layer.cornerRadius = 5;
    self.buttonSignUpView.clipsToBounds = YES;
    
    self.buttonLogInView.layer.cornerRadius = 5;
    self.buttonLogInView.clipsToBounds = YES;
    
    self.textEmailAddress.delegate = self;
//    self.textEmailAddress.layer.borderWidth = 0.0f;
    self.textPassword.delegate = self;
    self.textPasswordConfirm.delegate = self;
    
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

- (void) handleWhenKeyboardShow:(NSNotification *)paramNotification;
{
    // Add button Sign Up to keyboard
    UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    signUpButton.frame = CGRectMake(0, 163, 106, 53);
    signUpButton.adjustsImageWhenHighlighted = NO;
    [signUpButton setImage:[UIImage imageNamed:@"button_signup_keyboard.png"] forState:UIControlStateNormal];
    [signUpButton setImage:[UIImage imageNamed:@"button_signup_keyboard.png"] forState:UIControlStateHighlighted];
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
    [self performSelector:@selector(transformViewUp:) withObject:self.viewTextEmailAddress afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.textEmailAddress afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.textPassword afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.textPasswordConfirm afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.viewTextPassword afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.viewTextPasswordConfirm afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.buttonSignUpView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.buttonLogInView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.labelSignUp afterDelay:0];
    [self performSelector:@selector(hideLogo) withObject:nil afterDelay:0.1];
    [self performSelector:@selector(zoomViewOut:) withObject:self.imageLogoSignUpView afterDelay:0.3];
}

- (void) handleWhenKeyboardHide:(NSNotification *)paramSender;
{
    [self performSelector:@selector(transformViewDown:) withObject:self.textEmailAddress afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.textPassword afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.textPasswordConfirm afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.viewTextEmailAddress afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.viewTextPassword afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.viewTextPasswordConfirm afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.buttonSignUpView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.buttonLogInView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.labelSignUp afterDelay:0];
    [self performSelector:@selector(showLogo) withObject:nil afterDelay:0.5];
    [self performSelector:@selector(zoomViewIn:) withObject:self.imageLogoSignUpView afterDelay:0.3];
    
//    [self.textEmailAddress resignFirstResponder];
//    [self.textPassword resignFirstResponder];
//    [self.textPasswordConfirm resignFirstResponder];
}

- (void)dismissKeyboard;
{
    [self.textEmailAddress resignFirstResponder];
    [self.textPassword resignFirstResponder];
    [self.textPasswordConfirm resignFirstResponder];
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

- (void)showLogo;
{
    self.imageIconOption.hidden = NO;
}

- (void)hideLogo;
{
    self.imageIconOption.hidden = YES;
}

- (void)performStartSearchViewController;
{
    if ([self stringIsValidEmail:self.textEmailAddress.text] && ![self.textPassword.text isEqualToString:@""] && ![self.textPasswordConfirm.text isEqualToString:@""] && [self.textPassword.text isEqualToString:self.textPasswordConfirm.text]) {
        
        SearchViewController *homeTabBarView = [self.storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
        [self presentViewController:homeTabBarView animated:YES completion:nil];
        
    } else {
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter email and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [error show];
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

- (IBAction)close:(id)sender;
{
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)handleButtonSignUp:(id)sender;
{
    
    if ([self stringIsValidEmail:self.textEmailAddress.text] && ![self.textPassword.text isEqualToString:@""] && ![self.textPasswordConfirm.text isEqualToString:@""] && [self.textPassword.text isEqualToString:self.textPasswordConfirm.text]) {
        
        SearchViewController *homeTabBarView = [self.storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
        //        [self.navigationController pushViewController:homeTabBarView animated:YES];
        [self presentViewController:homeTabBarView animated:YES completion:nil];
        
    } else {
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter email and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [error show];
    }
}

- (IBAction)handleButtonLogin:(id)sender {
    
    id thePresenter = self.presentingViewController;
    
    // and test its class
    if ([thePresenter isKindOfClass:[LogInViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        LogInViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
        [self presentViewController:loginViewController animated:YES completion:nil];
    }
    
}

@end
