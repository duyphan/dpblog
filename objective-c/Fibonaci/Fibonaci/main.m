//
//  main.m
//  Fibonaci
//
//  Created by DP on 8/13/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int Fib[15], i;
        Fib[0] = 0;
        Fib[1] = 1;
        
        for (i = 2; i < 15; i++) {
            Fib[i] = Fib[i-2] + Fib[i-1];
        }
        for (i = 0; i < 15; i++) {
            NSLog(@"%i", Fib[i]);
        }
    }
    return 0;
}

