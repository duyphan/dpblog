//
//  ViewController.m
//  ProgressView
//
//  Created by DP on 9/9/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    self.progressView.center = self.view.center;
    self.progressView.progress = 20.0f / 30.0f;
    [self.view addSubview:self.progressView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
