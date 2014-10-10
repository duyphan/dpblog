//
//  MySegueSignUpToLogIn.m
//  MalltipProj
//
//  Created by DP on 10/10/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "MySegueSignUpToLogIn.h"

@implementation MySegueSignUpToLogIn
- (void)perform;
{
    UIViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;
    [UIView transitionFromView:source.view
                        toView:destination.view
                      duration:0.50f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished) { NSLog(@"Transitioning is finished");
                    }];
}
@end
