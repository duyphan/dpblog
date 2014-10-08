//
//  StoreDataManager.h
//  MalltipProj
//
//  Created by DP on 10/8/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"

@interface StoreDataManager : NSObject
- (NSArray *)getAllStores;
- (NSArray *)getStoresAtMallID:(NSInteger)mallID;
@end
