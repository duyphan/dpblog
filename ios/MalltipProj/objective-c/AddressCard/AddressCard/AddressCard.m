//
//  AddressCard.m
//  AddressCard
//
//  Created by DP on 8/19/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "AddressCard.h"
@implementation AddressCard

@synthesize name, email;

-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail
{
    self.name = theName;
    self.email = theEmail;
}
-(void) print
{
    NSLog(@"=================================");
    NSLog(@"|                               |");
    NSLog(@"|  %-31s | ", [name  UTF8String]);
    NSLog(@"|  %-31s | ", [email  UTF8String]);
    NSLog(@"|                               |");
    NSLog(@"|                               |");
    NSLog(@"=================================");
}

@end