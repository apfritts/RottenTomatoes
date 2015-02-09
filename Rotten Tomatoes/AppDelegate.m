//
//  AppDelegate.m
//  Rotten Tomatoes
//
//  Created by AP Fritts on 2/3/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "AppDelegate.h"
#import "MovieViewController.h"
#import "MoviesNavigationBar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Create the first view controller
    MovieViewController *movieViewController = [[MovieViewController alloc] initWithNibName:@"MovieViewController" bundle:nil];
    movieViewController.title = @"Movies";
    
    // Create a navication controller
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:movieViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[MoviesNavigationBar class] toolbarClass:nil];
    [navigationController.view setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:1]];
    [navigationController pushViewController:movieViewController animated:NO];
    
    // Setup the window and show it!
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
