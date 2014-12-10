//
//  StoreAPI.m
//  MalltipProj
//
//  Created by DP on 10/14/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "StoreAPI.h"

@interface StoreAPI() {
    
    NSMutableArray *_stores;
}

@end

@implementation StoreAPI

- (id)init;
{
    self = [super init];
    
    if (self) {
        
        _stores = [[NSMutableArray alloc] init];
        
        DataManager *data = [[DataManager alloc] init];
        NSArray *storesFromResource = [data getDataFromResource:@"stores" resourceType:@"json"];
        
        [storesFromResource enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            [_stores addObject:[[Store alloc] initWithStoreName:[obj objectForKey:@"storeName"]
                                                 numbersOfTips:[[obj objectForKey:@"numberOfTips"] integerValue]
                                                        mallID:[[obj objectForKey:@"mallId"] integerValue]]
             ];
            
            
        }];
    }
    
    return self;
}

- (NSArray *)getAllStores;
{
    return _stores;
}

- (NSArray *)getStoresAtMallID:(NSInteger)mallID;
{
    NSArray *storesAtMallID;
    
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"mallID == %ld", mallID];
    
    storesAtMallID = [_stores filteredArrayUsingPredicate:predicate];
    
    return storesAtMallID;
    
}
@end
