//
//  LibraryAPI.m
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "LibraryAPI.h"

@interface LibraryAPI()
{
    DataManager *dataManager;
    StoreDataManager *storeDataManager;
}
@end

@implementation LibraryAPI
+ (id)sharedInstance;
{
    static LibraryAPI *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (id)init;
{
    self = [super init];
    
    if (self) {
        dataManager = [[DataManager alloc] init];
        storeDataManager = [[StoreDataManager alloc] init];
    }
    
    return self;
}

- (NSArray *)getAllMalls;
{
    return [dataManager getAllMalls];
}

- (NSArray *)getAllStores;
{
    return [storeDataManager getAllStores];
}

- (NSArray *)getStoresAtMallID:(NSInteger)mallID;
{
    return [storeDataManager getStoresAtMallID:mallID];
}

@end
