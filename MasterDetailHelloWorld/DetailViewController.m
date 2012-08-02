//
//  DetailViewController.m
//  MasterDetailHelloWorld
//
//  Created by Sanchit on 01/08/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "DetailViewController.h"
#import "FileUtil.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item
@synthesize movieView;

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];

    [self initializeMoviePlayer];
    [self playFirstMovie:[FileUtil getFileList]];
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

- (void)playFirstMovie:(NSArray *) fileList
{
    for (NSString* file in fileList) {
        NSLog(@"++++++++++++++++++++++%@",file);
        if([file hasSuffix:@".m4v"])
        {
            NSString* absolutePath = [NSString stringWithFormat:@"%@/%@",[FileUtil getDocumentDirectory],file];
            NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:absolutePath];
            [self playMovie:fileURL];
        }
    }
}

- (void)playMovie:(NSURL*) movieURL
{
    [_moviePlayer setContentURL:movieURL];
    [_moviePlayer play];
}

@end
