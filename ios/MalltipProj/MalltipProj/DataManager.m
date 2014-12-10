//
//  DataManager.m
//  MalltipProj
//
//  Created by DP on 10/14/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "DataManager.h"
@interface DataManager()
@end

@implementation DataManager
+ (id)sharedInstance;
{
    static DataManager *instance = nil;
    
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
        //        dataManager = [[DataManager alloc] init];
        //        storeDataManager = [[StoreDataManager alloc] init];
    }
    
    return self;
}

- (NSArray *)getDataFromResource:(NSString *)resource resourceType:(NSString *)resourceType;
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:resource ofType:resourceType];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSArray *array = [dictionary objectForKey:resource];
    
    NSArray *lists = [NSArray arrayWithArray:array];
    
    return lists;
}
//
//- (NSArray *)getAllMalls;
//{
//    return [dataManager getAllMalls];
//}
//
//- (NSArray *)getAllStores;
//{
//    return [storeDataManager getAllStores];
//}
//
//- (NSArray *)getStoresAtMallID:(NSInteger)mallID;
//{
//    return [storeDataManager getStoresAtMallID:mallID];
//}

@end
