//
//  NetworkErrorView.m
//  Rotten Tomatoes
//
//  Created by AP Fritts on 2/8/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "NetworkErrorView.h"

@interface NetworkErrorView()

@property NSError *error;

@end

@implementation NetworkErrorView

-(instancetype)init {
    self = [super init];
    self.error = nil;
    return self;
}

- (void)showError:(NSError *)error {
    self.error = error;
    
    // Random needs
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    
    // Create the icon
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
    image.image = [UIImage imageNamed:@"error"];
    [self addSubview:image];
    
    // Create the description
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, width, 40)];
    [description setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1]];
    [description setTextAlignment:NSTextAlignmentCenter];
    [description setText:error.localizedDescription];
    [description setLineBreakMode:NSLineBreakByWordWrapping];
    [description setNumberOfLines:3];
    [self addSubview:description];
    
    // Create the action
    UILabel *action = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, width, 20)];
    [action setFont:[UIFont boldSystemFontOfSize:17]];
    [action setTextAlignment:NSTextAlignmentCenter];
    [action setText:@"Pull down to try again."];
    [self addSubview:action];
}

- (CGSize)intrinsicContentSize {
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    if (self.error == nil) {
        return CGSizeMake(width, 0);
    } else {
        return CGSizeMake(width, 90);
    }
}

-(void) clearError {
    self.error = nil;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
