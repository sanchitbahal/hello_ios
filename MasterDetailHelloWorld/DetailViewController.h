//
//  DetailViewController.h
//  MasterDetailHelloWorld
//
//  Created by Sanchit on 01/08/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (nonatomic, retain) IBOutlet MPMoviePlayerController* moviePlayer;
@property (strong, nonatomic) IBOutlet UIView *movieView;
@end
