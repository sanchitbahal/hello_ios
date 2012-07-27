//
//  HelloWorld.m
//  HelloWorld
//
//  Created by Manish Goyal on 27/07/12.
//  Copyright (c) 2012 nishu9601@gmail.com. All rights reserved.
//


#import <GHUnitIOS/GHUnit.h> 

@interface HelloWorld : GHTestCase { }
@end

@implementation HelloWorld

- (void)testStrings {       
    NSString *string1 = @"a string";
    GHTestLog(@"I can log to the GHUnit test console: %@", string1);
    
    // Assert string1 is not NULL, with no custom error description
    //GHAssertNotNULL(string1, (NSString*)NULL);
    
    // Assert equal objects, add custom error description
    NSString *string2 = @"a string";
    GHAssertEqualObjects(string1, string2, @"A custom error message. string1 should be equal to: %@.", string2);
}

@end