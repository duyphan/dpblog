//
//  LibraryAPI.h
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mall.h"
#import "DataManager.h"
#import "StoreDataManager.h"

@interface LibraryAPI : NSObject
@property (nonatomic, strong) NSMutableArray *selectedCategories;

+ (LibraryAPI *)sharedInstance;
- (NSArray *)getAllMalls;
- (NSArray *)getAllStores;
- (NSArray *)getStoresAtMallID:(NSInteger)mallID;

@end
