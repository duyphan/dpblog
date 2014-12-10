//
//  Rectangle.m
//  Inheritance
//
//  Created by DP on 8/6/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "Rectangle.h"
#import "XYPoint.h"

@implementation Rectangle
XYPoint *origin;
@synthesize width, height;
-(void) setWidth: (int) w andHeight: (int) h
{
    width = w;
    height = h;
}
-(int) area
{
    return width * height;
}
-(int) perimeter
{
    return (width + height) * 2;
}
-(void) setOrigin: (XYPoint *) pt
{
    origin = pt;
}
-(XYPoint *) origin
{
    return origin;
}
@end
