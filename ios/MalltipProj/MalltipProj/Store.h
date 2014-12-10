//
//  Store.h
//  MalltipProj
//
//  Created by DP on 10/8/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
@property (strong, nonatomic) NSString *storeName;
@property NSInteger numberOfTips;
@property NSInteger mallID;

- (id)initWithStoreName:(NSString *)storeName
         numbersOfTips:(NSInteger)numberOfTips
         mallID:(NSInteger)mallID;
@end
