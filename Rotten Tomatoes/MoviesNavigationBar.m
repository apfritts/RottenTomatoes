//
//  MoviesNavigationBar.m
//  Rotten Tomatoes
//
//  Created by AP Fritts on 2/8/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "MoviesNavigationBar.h"

@implementation MoviesNavigationBar

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    NSLog(@"initWithFrame");
    [self setBarStyle:UIBarStyleBlackOpaque];
    //[self setBarTintColor:[UIColor colorWithRed:255 green:0 blue:0 alpha:1]];
    [self setTintColor:[UIColor colorWithRed:255 green:0 blue:0 alpha:1]];
    return self;
}

-(instancetype)init {
    self = [super init];
    NSLog(@"init");
    return self;
}

@end
