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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
