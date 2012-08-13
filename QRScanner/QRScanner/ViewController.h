//
//  ViewController.h
//  QRScanner
//
//  Created by Sanchit on 13/08/12.
//  Copyright (c) 2012 ThoughtWorks Technologies (India) Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <ZBarReaderDelegate>

@property (nonatomic, retain) IBOutlet UIImageView *scannedImage;
@property (nonatomic, retain) IBOutlet UITextView *scannedText;

- (IBAction)scanButtonTapped;

@end
