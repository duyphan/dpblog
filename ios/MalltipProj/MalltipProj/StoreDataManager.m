//
//  StoreDataManager.m
//  MalltipProj
//
//  Created by DP on 10/8/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "StoreDataManager.h"

@interface StoreDataManager() {
    
    NSMutableArray *stores;
}

@end

@implementation StoreDataManager

- (NSArray *)getStoresFromResource:(NSString *)resource resourceType:(NSString *)resourceType;
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:resource ofType:resourceType];
    
    NSData *myData = [NSData dataWithContentsOfFile:filePath];
    
    NSDictionary *myDictionary = [NSJSONSerialization JSONObjectWithData:myData options:kNilOptions error:nil];
    
    NSArray *myArray = [myDictionary objectForKey:@"stores"];
    
    NSArray *storesList = [NSArray arrayWithArray:myArray];
    
    return storesList;
}

- (id)init;
{
    self = [super init];
    
    if (self) {
        
        stores = [[NSMutableArray alloc] init];
        
        NSArray *mallsFromResource = [self getStoresFromResource:@"stores"
                                                   resourceType:@"json"];
        
        [mallsFromResource enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            [stores addObject:[[Store alloc] initWithStoreName:[obj objectForKey:@"storeName"]
                                                        numbersOfTips:[[obj objectForKey:@"numberOfTips"] integerValue]
                                                        mallID:[[obj objectForKey:@"mallId"] integerValue]]
                                                ];
            
            
        }];
    }
    
    return self;
}

/*
 * Get all malls
 */
- (NSArray *)getAllStores;
{
    return stores;
}

- (NSArray *)getStoresAtMallID:(NSInteger)mallID;
{
    NSArray *storesAtMallID;
    
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"mallID == %ld", mallID];
    
    storesAtMallID = [stores filteredArrayUsingPredicate:predicate];
    
    return storesAtMallID;

}
@end
