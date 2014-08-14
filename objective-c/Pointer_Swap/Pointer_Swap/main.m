//
//  main.m
//  Pointer_Swap
//
//  Created by DP on 8/14/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>

void exchange (int *pint1, int *pint2) {
    int temp;
    temp = *pint1;
    *pint1 = *pint2;
    *pint2 = temp;
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        void exchange (int *p1, int *p2);
        int i1 = 1, i2 =2, *p1 = &i1, *p2 = &i2;
        
        NSLog(@"i1 = %i, i2 = %i", i1, i2);
        exchange(p1, p2);
        NSLog(@"i1 = %i, i2 = %i", i1, i2);
        exchange (&i1, &i2);
        NSLog(@"i1 = %i, i2 = %i", i1, i2);
        
    }
    return 0;
}

