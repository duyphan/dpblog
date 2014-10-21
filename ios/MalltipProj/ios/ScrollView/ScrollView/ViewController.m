//
//  ViewController.m
//  ScrollView
//
//  Created by DP on 9/8/14.
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
    UIImage *iPhone = [UIImage imageNamed:@"1.jpg"];
    UIImage *iPad = [UIImage imageNamed:@"22.jpg"];
    UIImage *macBookAir = [UIImage imageNamed:@"44.jpg"];
    CGRect scrollViewRect = self.view.bounds;
    self.myScrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.contentSize = CGSizeMake(scrollViewRect.size.width * 3.0f,
                                               scrollViewRect.size.height);
    [self.view addSubview:self.myScrollView];
    
    CGRect imageViewRect = self.view.bounds;
    UIImageView *iPhoneImageView = [self newImageViewWithImage:iPhone
                                                         frame:imageViewRect];
    [self.myScrollView addSubview:iPhoneImageView];
    
    /* Go to next page by moving the x position of the next image view */
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *iPadImageView = [self newImageViewWithImage:iPad
                                                       frame:imageViewRect];
    [self.myScrollView addSubview:iPadImageView];
    
    /* Go to next page by moving the x position of the next image view */
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *macBookAirImageView =
    [self newImageViewWithImage:macBookAir
                          frame:imageViewRect];
    [self.myScrollView addSubview:macBookAirImageView];
    
//    UIImage *imageToLoad = [UIImage imageNamed:@"1.jpg"];
//    self.myImageView = [[UIImageView alloc] initWithImage:imageToLoad];
//    self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [self.myScrollView addSubview:self.myImageView];
//    self.myScrollView.contentSize = self.myImageView.bounds.size;
//    self.myScrollView.delegate = self;
//    [self.view addSubview:self.myScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    self.myScrollView.alpha = 0.50f;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    self.myScrollView.alpha = 1.0f;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.myScrollView.alpha = 1.0f;
}

- (UIImageView *)newImageViewWithImage:(UIImage *)paramImage frame:(CGRect)paramFrame;
{
    UIImageView *result = [[UIImageView alloc] initWithFrame:paramFrame];
    result.contentMode = UIViewContentModeScaleAspectFit;
    result.image = paramImage;
    return result;
}
@end
