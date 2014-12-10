//
//  AddressBook.m
//  AddressCard
//
//  Created by DP on 8/20/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

@synthesize book, bookName;
-(id) initWithName: (NSString *) name;
{
    self = [super init];
    if (self) {
        bookName = [NSString stringWithString: name];
        book = [NSMutableArray array];
    }
    
    return self;
}
-(id) init;
{
    return [self initWithName: @"No Name"];
}

-(void) addCard: (AddressCard *) theCard;
{
    [book addObject: theCard];
}

-(NSUInteger) entries;
{
    return [book count];
}
-(void) list;
{
    NSLog(@"====== Contents of : %@ ===========", bookName);
    for(AddressCard *theCard in book)
        NSLog(@"%-20s     %-32s", [theCard.name UTF8String], [theCard.email UTF8String]);
    
}

-(AddressCard *) lookup: (NSString *) theName;
{
    for (AddressCard *nextCard in book) {
        if ([nextCard.name caseInsensitiveCompare: theName] == NSOrderedSame)
            return nextCard;
    }
    
    return nil;
}
@end