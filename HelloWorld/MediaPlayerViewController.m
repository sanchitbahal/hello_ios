//
//  MediaPlayerViewController.m
//  HelloWorld
//
//  Created by Manish Goyal on 30/07/12.
//  Copyright (c) 2012 nishu9601@gmail.com. All rights reserved.
//

#import "MediaPlayerViewController.h"

@implementation MediaPlayerViewController
    @synthesize movieView, moviePlayer;

    - (void) initializeMoviePlayer
    {
        moviePlayer = [[MPMoviePlayerController alloc] init];
        [moviePlayer prepareToPlay];
        [moviePlayer.view setFrame:self.view.bounds];
        [self.movieView addSubview:moviePlayer.view];
    }

    - (NSString*) getDocumentDirectory
    {
        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* documentDirectory = [paths objectAtIndex:0];
        return documentDirectory;
    }

    - (void) playFirstMovie:(NSArray*) fileList fromDirectory: (NSString*) dirPath
    {
        for (NSString* file in fileList) {
            NSLog(@"++++++++++++++++++++++%@",file);
            if([file hasSuffix:@".m4v"]) 
            {
                NSString* absolutePath = [NSString stringWithFormat:@"%@/%@",dirPath,file];
                NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:absolutePath];
                [self playMovie:fileURL];
            }
        }    
    }


    - (void) playMovie:(NSURL*) movieURL
    {
        [moviePlayer setContentURL:movieURL];
        [moviePlayer play];     
    }

    - (void) viewDidLoad
    {
        NSFileManager* fm = [NSFileManager defaultManager];
        NSString* documentDirectory = [self getDocumentDirectory];
        NSArray* files = [fm contentsOfDirectoryAtPath:documentDirectory error:NULL];
        [self initializeMoviePlayer];
        [self playFirstMovie:files fromDirectory:documentDirectory];
    }

    - (void) viewDidUnload
    {
        [super viewDidUnload];
    }


    - (void) writeToFile 
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        //make a file name to write the data to using the documents directory:
        NSString *fileName = [NSString stringWithFormat:@"%@//textfile.txt",documentsDirectory];
        //create content - four lines of text
        NSString *content = @"One\nTwo\nThree\nFour\nFive";
        //save content to the documents directory
        [content writeToFile:fileName atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
        NSLog(@"************************%@",documentsDirectory);    
    }
@end
