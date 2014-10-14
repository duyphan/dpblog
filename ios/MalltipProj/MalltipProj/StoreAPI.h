//
//  StoreAPI.h
//  MalltipProj
//
//  Created by DP on 10/14/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"
#import "DataManager.h"

@interface StoreAPI : NSObject
- (NSArray *)getAllStores;
- (NSArray *)getStoresAtMallID:(NSInteger)mallID;
@end
