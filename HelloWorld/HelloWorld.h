//
//  HelloWorld.h
//  HelloWorld
//
//  Created by Manish Goyal on 27/07/12.
//  Copyright (c) 2012 nishu9601@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelloWorld : NSObject
+ (NSString*)getGreeting;
+ (NSString*)getGreeting:(NSString*) name;
@end
