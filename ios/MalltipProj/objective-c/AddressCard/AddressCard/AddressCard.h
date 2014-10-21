//
//  AddressCard.h
//  AddressCard
//
//  Created by DP on 8/19/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject
//-(void) setName: (NSString *) theName;
//-(void) setEmail: (NSString *) theEmail;
//-(NSString *) name;
//-(NSString *) email;
@property (copy, nonatomic) NSString *name, *email;
-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail;
-(void) print;
@end
