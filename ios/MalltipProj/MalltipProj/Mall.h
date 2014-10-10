//
//  Mall.h
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mall : NSObject
@property (strong, nonatomic) NSString *mallName;
@property (strong, nonatomic) NSString *url;
@property NSInteger numberOfTips;
@property NSInteger numberOfStories;
@property NSInteger numberOfSaveTips;
@property NSInteger numberOfSaveStories;
@property NSInteger mallId;
@property NSArray *hours;
@property CGFloat distance;

- (id)initWithMallName:(NSString *)mallName
                mallId:(NSInteger)mallId
                   URL:(NSString *)URL
         numbersOfTips:(NSInteger)numberOfTips
       numberOfStories:(NSInteger)numberOfStories
      numberOfSaveTips:(NSInteger)numberOfSaveTips
   numberOfSaveStories:(NSInteger)numberOfSaveStories
                 hours:(NSArray *)hours
              distance:(CGFloat)distance;
@end
