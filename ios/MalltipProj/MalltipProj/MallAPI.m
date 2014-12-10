//
//  MallAPI.m
//  MalltipProj
//
//  Created by DP on 10/14/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "MallAPI.h"

@interface MallAPI() {
    
    NSMutableArray *_malls;
}

@end

@implementation MallAPI

- (id)init;
{
    self = [super init];
    
    if (self) {
        
        _malls = [[NSMutableArray alloc] init];
        
        DataManager *data = [[DataManager alloc] init];
        NSArray *mallsFromResource = [data getDataFromResource:@"malls" resourceType:@"json"];
        
        [mallsFromResource enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            [_malls addObject:[[Mall alloc] initWithMallName:[obj objectForKey:@"name"]
                                                     mallId:[[obj objectForKey:@"mallId"] integerValue]
                                                        URL:[obj objectForKey:@"url"]
                                              numbersOfTips:[[obj objectForKey:@"numberOfTips"] integerValue]
                                            numberOfStories:[[obj objectForKey:@"numberOfStories"] integerValue]
                                           numberOfSaveTips:[[obj objectForKey:@"numberOfSavedTips"] integerValue]
                                        numberOfSaveStories:[[obj objectForKey:@"numberOfSaveStories"] integerValue]
                                                      hours:[obj objectForKey:@"hours"]
                                                   distance:[[obj objectForKey:@"distance"] floatValue]]];
            
            
        }];
    }
    
    return self;
}

- (NSArray *)getAllMalls;
{
    return _malls;
}
@end
