//
//  HelloWorld.m
//  HelloWorld
//
//  Created by Manish Goyal on 27/07/12.
//  Copyright (c) 2012 nishu9601@gmail.com. All rights reserved.
//

#import "HelloWorld.h"

@implementation HelloWorld
+ (NSString*) getGreeting
{
    NSString* greeting = @"Hello, World!";
    return greeting;
}

+ (NSString*) getGreeting : (NSString*)name 
{
    NSString* greeting = [[NSString alloc] initWithFormat:@"Hello, %@!",name ];
    return greeting;
}
@end
