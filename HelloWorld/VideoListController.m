//
//  VideoListController.m
//  HelloWorld
//
//  Created by Manish Goyal on 31/07/12.
//  Copyright (c) 2012 nishu9601@gmail.com. All rights reserved.
//

#import "VideoListController.h"

@interface VideoListController ()
+ (void) setDocumentDirectory;
- (BOOL) isVideo: (NSString*) file;
- (void) addFilesToList;
@end

@implementation VideoListController
@synthesize myTableView, dataSource;
static NSArray* videoExtensions;
static NSString* documentDirectory;
static NSString* cellIdentifier = @"Cell";

+ (void) initialize
{
    videoExtensions = [[NSArray alloc] initWithObjects:@".m4v", @".flv", nil];
    [self setDocumentDirectory];
}

+ (void) setDocumentDirectory
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentDirectory = [paths objectAtIndex:0];
}

- (BOOL) isVideo: (NSString*) file
{
    for (NSString* videoExtension in videoExtensions) {
        if([file hasSuffix:videoExtension]) {
            return YES;
        }
    }
    return NO;    
}

- (void) addFilesToList
{
    NSFileManager* fm = [NSFileManager defaultManager];
    NSArray* files = [fm contentsOfDirectoryAtPath:documentDirectory error:NULL];
    for (NSString* file in files) {
        if([self isVideo:file]) {
            [dataSource addObject:file];
        }
    }
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    dataSource = [[NSMutableArray alloc] init];
    [self addFilesToList];
    self.navigationController.title = @"Videos";
    [myTableView setAllowsSelection:YES];
}



- (void) viewDidUnload
{
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
   return [dataSource count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier: cellIdentifier];
        
    }
    [cell setUserInteractionEnabled:YES];
    NSString* cellValue = [dataSource objectAtIndex:indexPath.section];
    cell.textLabel.text = cellValue;
    return cell;
}

- (NSIndexPath*) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath:(id)sender
{
    NSLog(@"/////////////didSelect");
    NSString* moviePath = [[NSString alloc] initWithFormat:@"@%/%@",documentDirectory,[dataSource objectAtIndex:indexPath.section]];
    MediaPlayerViewController* mediaController = [[MediaPlayerViewController alloc] initWithMoviePath:moviePath];
    [[self navigationController] pushViewController:mediaController animated:YES];
}


@end
