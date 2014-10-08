//
//  Store.m
//
//
//  Created by DP on 10/8/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "Store.h"

@implementation Store
- (id)initWithStoreName:(NSString *)storeName
          numbersOfTips:(NSInteger)numberOfTips
                 mallID:(NSInteger)mallID;
{
    self = [super init];
    
    if (self) {
        _storeName = storeName;
        _numberOfTips = numberOfTips;
        _mallID = mallID;
    }
    
    return self;
}
@end
