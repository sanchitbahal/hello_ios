//
//  FileUtil.h
//  MasterDetailHelloWorld
//
//  Created by Sanchit on 02/08/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtil : NSObject

+ (NSArray *)getFileList;
+ (NSString *)getDocumentDirectory;

@end