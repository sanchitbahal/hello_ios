//
//  VideoListController.h
//  HelloWorld
//
//  Created by Manish Goyal on 31/07/12.
//  Copyright (c) 2012 nishu9601@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MediaPlayerViewController.h"

@interface VideoListController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,retain) IBOutlet UITableView* myTableView;
@property(nonatomic, retain) IBOutlet NSMutableArray* dataSource;
@end
