//
//  DataManager.m
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "DataManager.h"

@interface DataManager() {
    
    NSMutableArray *malls;
}

@end

@implementation DataManager

- (NSArray *)getMallsFromResource:(NSString *)resource resourceType:(NSString *)resourceType;
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:resource ofType:resourceType];
    
    NSData *myData = [NSData dataWithContentsOfFile:filePath];
    
    NSDictionary *myDictionary = [NSJSONSerialization JSONObjectWithData:myData options:kNilOptions error:nil];
    
    NSArray *myArray = [myDictionary objectForKey:@"malls"];
    
    NSArray *mallsList = [NSArray arrayWithArray:myArray];
    
    return mallsList;
}

- (id)init;
{
    self = [super init];
    
    if (self) {
        
        malls = [[NSMutableArray alloc] init];
        
        NSArray *mallsFromResource = [self getMallsFromResource:@"malls"
                                                   resourceType:@"json"];
        
        [mallsFromResource enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            [malls addObject:[[Mall alloc] initWithMallName:[obj objectForKey:@"name"]
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

/*
 * Get all malls
 */
- (NSArray *)getAllMalls;
{
    return malls;
}
@end
