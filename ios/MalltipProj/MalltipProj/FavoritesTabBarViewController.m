//
//  FavoritesTabBarViewController.m
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "FavoritesTabBarViewController.h"

@interface FavoritesTabBarViewController ()

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

@end
