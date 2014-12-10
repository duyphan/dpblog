//
//  main.m
//  Pointer
//
//  Created by DP on 8/14/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        struct date {
            int month;
            int day;
            int year;
        };
        struct date today, *datePtr;
        
        datePtr = &today;
        datePtr->month = 6;
        datePtr->day = 12;
        datePtr->year = 1989;
        
        NSLog (@"Today's date is %i/%i/%.2i.", datePtr->month, datePtr->day, datePtr->year % 100);
        NSLog (@"Today's date is %i/%i/%.2i.", datePtr->month, datePtr->day, today.year % 100);
        
        today.day = 20;
        today.month = 1;
        today.year = 1988;
        
        NSLog (@"Today's date is %i/%i/%.2i.", datePtr->month, datePtr->day, datePtr->year % 100);
        NSLog (@"Today's date is %i/%i/%.2i.", datePtr->month, datePtr->day, today.year % 100);
        
    }
    return 0;
}

