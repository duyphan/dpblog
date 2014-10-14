//
//  TransformViewHelper.m
//  MalltipProj
//
//  Created by DP on 10/13/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "TransformViewHelper.h"

@implementation TransformViewHelper

- (void)transformViewUp:(UIView *)view;
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -100);
    view.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}

@end
