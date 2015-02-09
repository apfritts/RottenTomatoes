//
//  MovieViewController.m
//  Rotten Tomatoes
//
//  Created by AP Fritts on 2/3/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "MovieDetailViewController.h"
#import "NetworkErrorView.h"

@interface MovieViewController ()

@property NSArray* movies;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) NetworkErrorView *errorView;

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieViewCell" bundle:nil] forCellReuseIdentifier:@"MovieViewCell"];
    
    self.errorView = [[NetworkErrorView alloc] init];
    [self.tableView insertSubview:self.errorView atIndex:0];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    [self refreshData];
}

-(void)refreshData {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=3z78erjrcsh5dnbk76sbzgwv&limit=20&country=us";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [self.refreshControl endRefreshing];
        if (connectionError == nil) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.movies = object[@"movies"];
            [self.errorView clearError];
        } else {
            [self.errorView showError:connectionError];
            self.movies = [[NSArray alloc] init];
        }
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.movie = self.movies[indexPath.row];
    [cell refresh];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Create the next view controller.
    MovieDetailViewController *detailViewController = [[MovieDetailViewController alloc] initWithNibName:@"MovieDetailViewController" bundle:[NSBundle mainBundle]];
    //detailViewController.movie = self.movies[indexPath.row];
    [detailViewController setMovie:self.movies[indexPath.row]];
    
    // Pass the selected object to the new view controller.
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
