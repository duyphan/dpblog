//
//  ViewController.m
//  WebView
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
    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.myWebView.scalesPageToFit = YES;
    [self.view addSubview:self.myWebView];
    
//    NSString *htmlString = @"<br/> iOS 7 Programming <strong>Cookbook</strong>";
    NSURL *url = [NSURL URLWithString:@"http://google.com"];
//    [self.myWebView loadHTMLString:htmlString baseURL:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
