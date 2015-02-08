//
//  MovieDetailViewController.h
//  Rotten Tomatoes
//
//  Created by AP Fritts on 2/7/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *synopsis;

@end
