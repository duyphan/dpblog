//
//  main.m
//  helloworld
//
//  Created by DP on 8/1/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import <Foundation/Foundation.h>
int main (int argc, const char * argv[]) {
    @autoreleasepool {
        int i;
        i = 1;
        NSLog (@"Testing...");
        NSLog (@"....%i", i);
        NSLog (@"...%i", i + 1);
        NSLog (@"..%i", i + 2);
    }
    return 0;
}

