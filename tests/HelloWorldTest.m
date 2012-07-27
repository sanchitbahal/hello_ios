//
//  HelloWorld.m
//  HelloWorld
//
//  Created by Manish Goyal on 27/07/12.
//  Copyright (c) 2012 nishu9601@gmail.com. All rights reserved.
//


#import <GHUnitIOS/GHUnit.h>
#import "HelloWorld.h"

@interface HelloWorldTest : GHTestCase { }
@end

@implementation HelloWorldTest

- (void) test_ShouldReturnHelloWorldIfNameNotSpecified 
{
    NSString* expectedGreeting = @"Hello, World!";
    NSString* actualGreeting = [HelloWorld getGreeting];
    GHAssertEqualStrings(actualGreeting, expectedGreeting,@"actualGreeting should be equal to %@",expectedGreeting);
}

- (void) test_ShouldReturnGreetingWithName
{
    NSString* expectedGreeting = @"Hello, Manish!";
    NSString* actualGreeting = [HelloWorld getGreeting:@"Manish"];
    GHAssertEqualStrings(actualGreeting, expectedGreeting,@"actualGreeting should be equal to %@",expectedGreeting);
}

@end