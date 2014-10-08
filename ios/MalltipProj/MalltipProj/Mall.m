//
//  Mall.m
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "Mall.h"

@implementation Mall
- (id)initWithMallName:(NSString *)mallName
                   URL:(NSString *)URL
         numbersOfTips:(NSInteger)numberOfTips
       numberOfStories:(NSInteger)numberOfStories
      numberOfSaveTips:(NSInteger)numberOfSaveTips
   numberOfSaveStories:(NSInteger)numberOfSaveStories
                 hours:(NSArray *)hours
              distance:(CGFloat)distance;
{
    self = [super init];
    
    if (self) {
        _mallName = mallName;
        _url = URL;
        _numberOfTips = numberOfTips;
        _numberOfStories = numberOfStories;
        _numberOfSaveTips = numberOfSaveTips;
        _numberOfSaveStories = numberOfSaveStories;
        _hours = hours;
        _distance = distance;
    }
    
    return self;
}
@end
