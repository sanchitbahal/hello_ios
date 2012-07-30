//
//  MediaPlayerViewController.m
//  HelloWorld
//
//  Created by Manish Goyal on 30/07/12.
//  Copyright (c) 2012 nishu9601@gmail.com. All rights reserved.
//

#import "MediaPlayerViewController.h"

@implementation MediaPlayerViewController
@synthesize myView, moviePlayer;
- (void) viewDidLoad
{
//    NSURL* movieURL = [[NSURL alloc] initWithString: @"http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"]; 
    NSURL* movieURL = [[NSURL alloc] initWithString: @"file:///Users/manish/iOS/Sample%20Projects/SampleVideoStreamApp/SampleVideoStreamApp/sample.m4v"];
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: movieURL];
    [moviePlayer prepareToPlay];
    [moviePlayer.view setFrame:self.view.bounds];
    [self.myView addSubview:moviePlayer.view];
    [moviePlayer play];     
}

- (void) viewDidUnload
{
    

}

@end
