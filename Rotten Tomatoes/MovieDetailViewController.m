//
//  MovieDetailViewController.m
//  Rotten Tomatoes
//
//  Created by AP Fritts on 2/7/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "MovieDetailViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface MovieDetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *posterContainer;
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UIView *textContainer;
@property (weak, nonatomic) IBOutlet UILabel *movieRating;
@property (weak, nonatomic) IBOutlet UILabel *movieCritics;
@property (weak, nonatomic) IBOutlet UILabel *movieAudience;
@property (weak, nonatomic) IBOutlet UILabel *movieSynopsis;
- (IBAction)movieImageTap:(id)sender;

@property NSDictionary *movie;
@property UIImage *thumbnail;

@property CGFloat scrollAtBottom;

-(void)setField:(UILabel *)field fromPercent:(id)percent;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.movie != nil) {
        NSDictionary *images = self.movie[@"posters"];
        NSString *thumbnailUrl = [NSString stringWithFormat:@"%@", images[@"thumbnail"]];
        NSString *highResUrl = [thumbnailUrl stringByReplacingOccurrencesOfString:@"tmb" withString:@"ori"];
        [self.movieImage setImageWithURL:[NSURL URLWithString:highResUrl]placeholderImage:[UIImage imageNamed:@"poster.png"]];
        [self setTitle:self.movie[@"title"]];
        
        self.movieSynopsis.text = self.movie[@"synopsis"];
        self.movieRating.text = [NSString stringWithFormat:@"%@", self.movie[@"mpaa_rating"]];
        [self.movieRating setFont:[UIFont boldSystemFontOfSize:15.0]];
        [self setField:self.movieAudience fromPercent:self.movie[@"ratings"][@"audience_score"]];
        [self setField:self.movieCritics fromPercent:self.movie[@"ratings"][@"critics_score"]];
        
        [self.movieSynopsis sizeToFit];
        [self.textContainer sizeToFit];
        
        CGSize size = CGSizeMake([self.textContainer bounds].size.width, [self.textContainer bounds].size.height + 454);
        NSLog(@"%f by %f", size.width, size.height);
        [self.scrollView setContentSize:size];
        
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        
        self.scrollAtBottom = fabsf(screenSize.height - size.height);
        NSLog(@"%f", self.scrollAtBottom);
    }
}

-(void)setField:(UILabel *)field fromPercent:(id)numberString {
    NSString *number = [NSString stringWithFormat:@"%@", numberString];
    field.text = [NSString stringWithFormat:@"%@%%", number];
    int percent = [number intValue];
    if (percent > 80) {
        field.textColor = [UIColor colorWithRed:0 green:177 blue:79 alpha:1];
    } else if (percent > 50) {
        field.textColor = [UIColor colorWithRed:255 green:168 blue:77 alpha:1];
    } else {
        field.textColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:1];
    }
    [field setFont:[UIFont boldSystemFontOfSize:15.0]];
}

- (IBAction)movieImageTap:(id)sender {
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    CGPoint point = [tap locationInView:self.scrollView];
    if (point.y - 454 < 0) {
        NSLog(@"Image tap");
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Change the alpha depending on how much we've scrolled
    CGFloat alpha = 0.5 * (fabsf(scrollView.contentOffset.y) / self.scrollAtBottom) + 0.5;
    if (alpha > 1.0) {
        alpha = 1.0;
    } else if (alpha < 0.5) {
        alpha = 0.5;
    }
    NSLog([NSString stringWithFormat:@"%f", alpha ]);
    [self.textContainer setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:alpha]];
}

@end
