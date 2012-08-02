//
//  FileUtil.m
//  MasterDetailHelloWorld
//
//  Created by Sanchit on 02/08/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil

+ (NSArray *)getFileList
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *documentDirectory = [self getDocumentDirectory];
    NSArray *files = [fm contentsOfDirectoryAtPath:documentDirectory error:NULL];
    return files;
}

+ (NSString *)getDocumentDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return documentDirectory;
}

@end
