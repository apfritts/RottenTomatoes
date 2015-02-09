//
//  MovieViewCell.m
//  Rotten Tomatoes
//
//  Created by AP Fritts on 2/3/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "MovieViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation MovieViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void) refresh {
    self.titleLabel.text = self.movie[@"title"];
    self.descriptionLabel.text = self.movie[@"synopsis" ];
    NSDictionary *posters = self.movie[@"posters"];
    NSString *posterUrlString = posters[@"detailed"];
    [self.poster setImageWithURL:[NSURL URLWithString:posterUrlString]];
    
    //CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    //CGFloat left = 70;
    //[self.titleLabel setBounds:CGRectMake(left, self.titleLabel.bounds.origin.y, width - left, self.titleLabel.bounds.size.height)];
    //[self.descriptionLabel setBounds:CGRectMake(left, self.descriptionLabel.bounds.origin.y, width - left, self.descriptionLabel.bounds.size.height)];
}

@end
