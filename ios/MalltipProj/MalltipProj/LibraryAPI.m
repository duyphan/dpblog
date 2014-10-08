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
//    MTSavedTipDatamanager *savedTipDatamanager;
//    MTTipDataManager *tipDataManager;
//    MTTipsCategoryDataManager *tipCategoryDataManager;
}
@end

@implementation LibraryAPI
+ (id)sharedInstance;
{
    // Declare a static to hold the instance of MTLibraryAPI
    static LibraryAPI *instance = nil;
    
    // Declare the static variable dispatch_one_t to ensures the initializition code executes only one
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
//        savedTipDatamanager = [[MTSavedTipDatamanager alloc] init];
//        tipDataManager = [[MTTipDataManager alloc] init];
//        tipCategoryDataManager = [[MTTipsCategoryDataManager alloc] init];
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
//
//- (NSArray *)getAllSavedTips;
//{
//    return [savedTipDatamanager getAllSaveTips];
//}
//
//- (NSArray *)getAllTips;
//{
//    return [tipDataManager getAllTips];
//}
//
//- (NSArray *)getAllTipCategories;
//{
//    return [tipCategoryDataManager getAllTipCategories];
//}

@end
