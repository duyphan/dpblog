//
//  Fraction.h
//  FractionTest
//
//  Created by DP on 8/4/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
    -(void) print;
    -(void) setNumerator: (int) n; -(void) setDenominator: (int) d; -(int) numerator;
    -(int) denominator;
    -(double) convertToNum;
@end
