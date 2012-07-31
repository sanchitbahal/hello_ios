//
//  MediaPlayerViewController.h
//  HelloWorld
//
//  Created by Manish Goyal on 30/07/12.
//  Copyright (c) 2012 nishu9601@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MediaPlayerViewController : UIViewController
@property (nonatomic, retain) IBOutlet MPMoviePlayerController* moviePlayer;
@property (nonatomic,retain) IBOutlet UIView *movieView; 
@end
