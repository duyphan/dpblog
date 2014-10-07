//
//  SearchViewController.m
//  MalltipProj
//
//  Created by DP on 10/3/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchResultViewController.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageLogoSearchView;
@property (weak, nonatomic) IBOutlet UIImageView *imageIconOptionSeachView;
@property (weak, nonatomic) IBOutlet UILabel *labelDescriptionSearchView;
@property (weak, nonatomic) IBOutlet UILabel *labelSearchSearchView;
@property (weak, nonatomic) IBOutlet UIView *viewTextSearchSearchView;
@property (weak, nonatomic) IBOutlet UITextField *textSearchSearchView;
@property (weak, nonatomic) IBOutlet UIImageView *imageUnderscoreSearchView;
@property (weak, nonatomic) IBOutlet UIImageView *imageOrSearchView;
@property (weak, nonatomic) IBOutlet UIButton *buttonFindSearchView;

- (IBAction)buttonFindSearchView:(id)sender;

@end

@implementation SearchViewController

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
    self.navigationController.navigationBar.hidden = YES;
    
    // Custom UI
    self.viewTextSearchSearchView.layer.cornerRadius = 5;
    self.viewTextSearchSearchView.clipsToBounds = YES;
    
    self.textSearchSearchView.delegate = self;
    
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
    self.navigationController.navigationBar.hidden = YES;
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
    [signUpButton setImage:[UIImage imageNamed:@"button_search_keyboard.png"] forState:UIControlStateNormal];
    [signUpButton setImage:[UIImage imageNamed:@"button_search_keyboard.png"] forState:UIControlStateHighlighted];
    [signUpButton addTarget:self action:@selector(performResultSearchViewController) forControlEvents:UIControlEventTouchUpInside];
    
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
    [self performSelector:@selector(transformViewUpIconOption:) withObject:self.imageIconOptionSeachView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.labelSearchSearchView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.viewTextSearchSearchView afterDelay:0];
    [self performSelector:@selector(transformViewUp:) withObject:self.textSearchSearchView afterDelay:0];
    [self performSelector:@selector(hideIconAndButton) withObject:nil afterDelay:0.1];
}

- (void) handleWhenKeyboardHide:(NSNotification *)paramSender;
{
    [self performSelector:@selector(transformViewDown:) withObject:self.imageIconOptionSeachView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.labelSearchSearchView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.viewTextSearchSearchView afterDelay:0];
    [self performSelector:@selector(transformViewDown:) withObject:self.textSearchSearchView afterDelay:0];
    [self performSelector:@selector(showIconAndButton) withObject:nil afterDelay:0.5];
}

- (void)transformViewUp:(UIView *)myView;
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -80);
    myView.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

- (void)transformViewUpIconOption:(UIView *)myView;
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -10);
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

- (void)showIconAndButton;
{
    self.labelDescriptionSearchView.hidden = NO;
    self.imageUnderscoreSearchView.hidden = NO;
    self.imageOrSearchView.hidden = NO;
    self.buttonFindSearchView.hidden = NO;
}

- (void)hideIconAndButton;
{
    self.labelDescriptionSearchView.hidden = YES;
    self.imageUnderscoreSearchView.hidden = YES;
    self.imageOrSearchView.hidden = YES;
    self.buttonFindSearchView.hidden = YES;
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

- (void)performResultSearchViewController;
{
    if (![self.textSearchSearchView.text isEqualToString:@""]) {
        SearchResultViewController *searchResultView = [self.storyboard instantiateViewControllerWithIdentifier:@"searchResultViewController"];
        
        [self.navigationController pushViewController:searchResultView animated:YES];
        
    } else {
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Empty text search" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [error show];
    }
}

- (IBAction)buttonFindSearchView:(id)sender {
}
@end
