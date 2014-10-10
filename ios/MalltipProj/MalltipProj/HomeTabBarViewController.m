//
//  HomeTabBarViewController.m
//  MalltipProj
//
//  Created by DP on 10/6/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "HomeTabBarViewController.h"

@interface HomeTabBarViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentsView;
@property (weak, nonatomic) IBOutlet UILabel *nameOfMall;
@property (weak, nonatomic) IBOutlet UIImageView *imageBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeeAllHours;
@property (weak, nonatomic) IBOutlet UIButton *buttonHideAllHours;
@property (weak, nonatomic) IBOutlet UILabel *labelDayOfWeek;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeOfWeek;
@property (weak, nonatomic) IBOutlet UILabel *numberOfTips;
@property (weak, nonatomic) IBOutlet UILabel *numberOfStores;
@property (weak, nonatomic) IBOutlet UILabel *numberOfSavedTips;
@property (weak, nonatomic) IBOutlet UILabel *numberOfSavedStores;
- (IBAction)handlePerformSeeAllHours:(id)sender;
- (IBAction)handleHideAllHours:(id)sender;
- (IBAction)changeTabStore:(id)sender;
- (IBAction)changeTabTib:(id)sender;
@end

@implementation HomeTabBarViewController

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
    self.buttonHideAllHours.hidden = YES;
    self.labelDayOfWeek.hidden = YES;
    self.labelTimeOfWeek.hidden = YES;
    self.nameOfMall.text = self.mall.mallName;
    self.numberOfTips.text = [NSString stringWithFormat:@"%ld", (long)self.mall.numberOfTips];
    self.numberOfStores.text = [NSString stringWithFormat:@"%ld", (long)self.mall.numberOfStories];
    self.numberOfSavedTips.text = [NSString stringWithFormat:@"%ld", (long)self.mall.numberOfSaveTips];
    self.numberOfSavedStores.text = [NSString stringWithFormat:@"%ld", (long)self.mall.numberOfSaveStories];

}

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)handleHideAllHours:(id)sender;
{
    [self.imageBackgroundView setFrame:CGRectMake(0, 20, 320, 122)];
    [self performSelector:@selector(transformViewUp:) withObject:self.contentsView afterDelay:0];
    self.buttonSeeAllHours.hidden = NO;
    self.buttonHideAllHours.hidden = YES;
    self.labelDayOfWeek.hidden = YES;
    self.labelTimeOfWeek.hidden = YES;
    self.labelTime.hidden = NO;
}

- (IBAction)handlePerformSeeAllHours:(id)sender;
{
    [self.imageBackgroundView setFrame:CGRectMake(0, 20, 320, 209)];
    [self performSelector:@selector(transformViewDown:) withObject:self.contentsView afterDelay:0];
    self.buttonSeeAllHours.hidden = YES;
    self.buttonHideAllHours.hidden = NO;
    self.labelDayOfWeek.hidden = NO;
    self.labelTimeOfWeek.hidden = NO;
    self.labelTime.hidden = YES;
}

- (void)transformViewUp:(UIView *)myView;
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

- (void)transformViewDown:(UIView *)myView;
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 87);
    myView.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

- (IBAction)changeTabStore:(id)sender {
    [self.tabBarController setSelectedIndex:1];
}

- (IBAction)changeTabTib:(id)sender {
    [self.tabBarController setSelectedIndex:2];
}
@end
