//
//  DetailViewController.m
//  MasterDetailHelloWorld
//
//  Created by Sanchit on 01/08/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "DetailViewController.h"
#import "FileUtil.h"

@implementation DetailViewController

#pragma mark - Managing the detail item
@synthesize movieView;

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initializeMoviePlayer];
    NSString *absolutePath = [NSString stringWithFormat:@"%@/%@",[FileUtil getDocumentDirectory], self.detailItem];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:absolutePath];
    [self playMovie:fileURL];
}

- (void)viewDidUnload
{
    [self setMovieView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)initializeMoviePlayer
{
    _moviePlayer = [[MPMoviePlayerController alloc] init];
    [_moviePlayer prepareToPlay];
    [_moviePlayer.view setFrame:self.view.bounds];
    [self.movieView addSubview:_moviePlayer.view];
}

- (void)playMovie:(NSURL*) movieURL
{
    [_moviePlayer setContentURL:movieURL];
    [_moviePlayer play];
}

@end
