//
//  FavoritesTabBarViewController.m
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "FavoritesTabBarViewController.h"

@interface FavoritesTabBarViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentControl;
@property (weak, nonatomic) IBOutlet UIView *storeView;
@property (weak, nonatomic) IBOutlet UIView *tipView;
- (IBAction)SegmentedControlChanged:(UISegmentedControl *)sender;
@end

@implementation FavoritesTabBarViewController

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
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"FAVORITES";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:(239.0/255.0) green:(145.0/255.0) blue:(23.0/255.0) alpha:1]};
    
//    UIBezierPath *maskPathButtonTip;
//    UIBezierPath *maskPathButtonStore;
//    
//    maskPathButtonTip = [UIBezierPath bezierPathWithRoundedRect:self.buttonTips.bounds
//                                     byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
//                                           cornerRadii:CGSizeMake(5.0, 5.0)];
//    
//    CAShapeLayer *maskLayerButtonTip = [[CAShapeLayer alloc] init];
//    maskLayerButtonTip.frame = self.buttonTips.bounds;
//    maskLayerButtonTip.path = maskPathButtonTip.CGPath;
//    self.buttonTips.layer.mask = maskLayerButtonTip;
//    
//    maskPathButtonStore = [UIBezierPath bezierPathWithRoundedRect:self.buttonStores.bounds
//                                              byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
//                                                    cornerRadii:CGSizeMake(5.0, 5.0)];
//    
//    CAShapeLayer *maskLayerButtonStore = [[CAShapeLayer alloc] init];
//    maskLayerButtonStore.frame = self.buttonStores.bounds;
//    maskLayerButtonStore.path = maskPathButtonStore.CGPath;
//    self.buttonStores.layer.mask = maskLayerButtonStore;
//    
//    [self.buttonTips setImage:[UIImage imageNamed:@"bg-button-tip-selected.png"] forState:UIControlStateSelected];
//    [self.buttonStores setImage:[UIImage imageNamed:@"bg-button-store-selected.png"] forState:UIControlStateSelected];

}

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.selectedImageTintColor = [UIColor colorWithRed:239.0/225.0
                                                                          green:145.0/255.0
                                                                           blue:23.0/255.0
                                                                          alpha:1.0];
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

- (IBAction)SegmentedControlChanged:(UISegmentedControl *)sender {
    UIColor *tintcolor1 = [UIColor greenColor];
    UIColor *tintcolor2 = [UIColor blackColor];
    switch (sender.selectedSegmentIndex) {
        case 0:
//            [[sender.subviews objectAtIndex:sender.selectedSegmentIndex] setBackgroundColor:tintcolor1];
            self.storeView.hidden = YES;
            self.tipView.hidden = NO;
            break;
        case 1:
//            [[sender.subviews objectAtIndex:sender.selectedSegmentIndex] setBackgroundColor:tintcolor2];
            self.storeView.hidden = NO;
            self.tipView.hidden = YES;
            break;
        default:
            break;
    }
}
@end
