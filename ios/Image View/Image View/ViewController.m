//
//  ViewController.m
//  Image View
//
//  Created by DP on 9/8/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *myImageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *macbookAir = [UIImage imageNamed:@"1.jpg"];
//    self.myImageView = [[UIImageView alloc] initWithImage:macbookAir];
    self.myImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.myImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.myImageView.image = macbookAir;
    self.myImageView.center = self.view.center;
    [self.view addSubview:self.myImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
