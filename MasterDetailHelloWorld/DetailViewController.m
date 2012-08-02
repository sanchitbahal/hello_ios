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
    [_moviePlayer  prepareToPlay];
    [self.movieView addSubview:_moviePlayer.view];
    [_moviePlayer setControlStyle:MPMovieControlStyleFullscreen];
    //_moviePlayer.view.transform = CGAffineTransformConcat(_moviePlayer.view.transform, CGAffineTransformMakeRotation(M_PI_2));
    UIWindow *backgroundWindow = [[UIApplication sharedApplication] keyWindow];
    [_moviePlayer.view setFrame:backgroundWindow.frame];
    [backgroundWindow addSubview:_moviePlayer.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MPMoviePlayerDidExitFullscreen:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

- (void)playMovie:(NSURL*) movieURL
{
    [_moviePlayer setContentURL:movieURL];
    [_moviePlayer play];
}

- (void)MPMoviePlayerDidExitFullscreen:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
    
    [_moviePlayer stop];
    [_moviePlayer.view removeFromSuperview];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
