//
//  MallAPI.h
//  MalltipProj
//
//  Created by DP on 10/14/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mall.h"
#import "DataManager.h"

@interface MallAPI : NSObject
- (NSArray *)getAllMalls;
- (id)init;
@end
