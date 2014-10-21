//
//  DataManager.h
//  MalltipProj
//
//  Created by DP on 10/14/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mall.h"
#import "DataManager.h"
#import "StoreAPI.h"

@interface DataManager : NSObject

@property (nonatomic, strong) NSMutableArray *selectedCategories;
+ (DataManager *)sharedInstance;
- (NSArray *)getDataFromResource:(NSString *)resource resourceType:(NSString *)resourceType;
@end
