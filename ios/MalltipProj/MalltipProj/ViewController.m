//
//  ViewController.m
//  MalltipProj
//
//  Created by DP on 9/30/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"
#import "SignUpViewController.h"

static BOOL check = NO;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonSignUp;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogIn;
@property (weak, nonatomic) IBOutlet UIButton *buttonStartBrowsing;
@property (weak, nonatomic) IBOutlet UIImageView *imageLogo;
@property (weak, nonatomic) IBOutlet UIImageView *imageTip;
@property (weak, nonatomic) IBOutlet UIImageView *imageStore;
@property (weak, nonatomic) IBOutlet UIImageView *imageFavorite;
@property (weak, nonatomic) IBOutlet UIImageView *imageMallmap;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UIImageView *imageOr;
@property (weak, nonatomic) IBOutlet UIImageView *imageUnderscore;
@property (weak, nonatomic) IBOutlet UIImageView *imageWelcome;
- (IBAction)buttonSignUp:(id)sender;
- (IBAction)buttonLogIn:(id)sender;
- (IBAction)buttonStartBrowsing:(id)sender;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = YES;
    
    // Position Image logo
    self.imageLogo.frame = CGRectMake(65, 235, 192, 83);
    
    // Position Image icon
    self.imageTip.frame = CGRectMake(51, 324, 38, 38);
    self.imageStore.frame = CGRectMake(115, 324, 37, 34);
    self.imageFavorite.frame = CGRectMake(179, 324, 37, 34);
    self.imageMallmap.frame = CGRectMake(238, 324, 27, 38);
    
    // Position Image Welcome
    self.imageWelcome.frame = CGRectMake(78, 126, 169, 13);
    
    // Position label description
    self.labelDescription.frame = CGRectMake(24, 380, 273, 43);
    
    // Custom button SignUp    
    self.buttonSignUp.frame = CGRectMake(43, 331, 235, 42);
    self.buttonSignUp.layer.cornerRadius = 5;
    self.buttonSignUp.clipsToBounds = YES;
    
    // Custom button LogIn
    self.buttonLogIn.frame = CGRectMake(43, 381, 235, 42);
    self.buttonLogIn.layer.cornerRadius = 5;
    self.buttonLogIn.clipsToBounds = YES;
    
    
    // Position Or icon and Underscore icon
    self.imageOr.frame = CGRectMake(146, 439, 28, 28);
    self.imageUnderscore.frame = CGRectMake(110, 452, 100, 2);
    
    // Custom button LogIn
    self.buttonStartBrowsing.frame = CGRectMake(43, 482, 235, 42);
    self.buttonStartBrowsing.layer.cornerRadius = 5;
    self.buttonStartBrowsing.clipsToBounds = YES;
    
    [self hideAll];
    
    [self performSelector:@selector(moveImageView) withObject:nil afterDelay:2.0];
    [self performSelector:@selector(moveImageView) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(showAll) withObject:nil afterDelay:3.0];
    [self performSelector:@selector(startFlash) withObject:nil afterDelay:3.0];
    [self performSelector:@selector(stopFlash) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(showAll) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(moveImageLogoAndLabel) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(hideImageWelcome) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(showButtonAndOrIcon) withObject:nil afterDelay:6.0];
}

- (void)viewDidAppear:(BOOL)animated;
{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning;
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonSignUp:(id)sender;
{
}

- (IBAction)buttonLogIn:(id)sender;
{
}

- (IBAction)buttonStartBrowsing:(id)sender;
{
}

- (void)hideAll;
{
    self.imageTip.hidden = YES;
    self.imageStore.hidden = YES;
    self.imageFavorite.hidden = YES;
    self.imageMallmap.hidden = YES;
    self.imageWelcome.hidden = YES;
    self.labelDescription.hidden = YES;
    self.buttonSignUp.hidden = YES;
    self.buttonLogIn.hidden = YES;
    self.buttonStartBrowsing.hidden = YES;
    self.imageOr.hidden = YES;
    self.imageUnderscore.hidden = YES;
}

- (void)moveImageLogoAndLabel;
{
    [self moveView:self.imageTip];
    [self moveView:self.imageStore];
    [self moveView:self.imageFavorite];
    [self moveView:self.imageMallmap];
    [self moveView:self.labelDescription];
}

- (void)moveView:(UIView *)myView;
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -130);
    myView.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

- (void)moveImageView;
{
    int a;
    if (!check) {
        a = -52;
        check = !check;
    } else {
        a = -175;
    }
    
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, a);
    self.imageLogo.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

- (void)showButtonAndOrIcon;
{
    self.buttonSignUp.hidden = NO;
    self.buttonLogIn.hidden = NO;
    self.buttonStartBrowsing.hidden = NO;
    self.imageOr.hidden = NO;
    self.imageUnderscore.hidden = NO;
}

- (void)showAll;
{
    self.imageTip.hidden = NO;
    self.imageStore.hidden = NO;
    self.imageFavorite.hidden = NO;
    self.imageMallmap.hidden = NO;
    self.labelDescription.hidden = NO;
    self.imageWelcome.hidden = NO;
}

- (void)startFlash;
{
    self.mytimer = [NSTimer scheduledTimerWithTimeInterval:0.2f
                                                    target:self
                                                  selector:@selector(willStartBlinkingAnimation)
                                                  userInfo:nil
                                                   repeats:YES];
}

- (void) willStartBlinkingAnimation;
{
    [UIView animateWithDuration:1.f
                     animations:^{
                         [self.imageTip setHidden:![self.imageTip isHidden]];
                         [self.imageStore setHidden:![self.imageStore isHidden]];
                         [self.imageFavorite setHidden:![self.imageFavorite isHidden]];
                         [self.imageMallmap setHidden:![self.imageMallmap isHidden]];
                         [self.imageWelcome setHidden:![self.imageWelcome isHidden]];
                         [self.labelDescription setHidden:![self.labelDescription isHidden]];
                     }];
}

- (void)stopFlash;
{
    [self.mytimer invalidate];
    self.mytimer = nil;
}

- (void)hideImageWelcome;
{
    self.imageWelcome.hidden = YES;
}
@end
