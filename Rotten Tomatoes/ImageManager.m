//
//  ImageManager.m
//  Rotten Tomatoes
//
//  Created by AP Fritts on 2/8/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageManager : NSObject
+(void)fetchImage:(NSString *)name from:(NSString *)url;
+(void)setImage:(NSString *)name toView:(UIImageView *)view;
@end

@implementation ImageManager

static NSDictionary *images = nil;

+(void)fetchImage:(NSString *)name from:(NSString *)url {
    if (images == nil) {
        images = [[NSDictionary alloc] init];
    }
    
}

+(void)setImage:(NSString *)name toView:(UIImageView *)view {
    if (images == nil) {
        images = [[NSDictionary alloc] init];
    }
    
}

@end