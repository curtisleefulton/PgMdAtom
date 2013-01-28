//
//  PgMdAtomDateParserTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomDateParserTest.h"
#import "PgMdAtomDateParser.h"

@implementation PgMdAtomDateParserTest


- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)test1
{
    
    PgMdAtomDateParser *dateParser = [[PgMdAtomDateParser alloc]init:@"en_US"];
    
    NSError *error = nil;
    
    NSDate *result = [dateParser parseRFC3339:@"bogus":&error];
    
    STAssertNotNil(error, @"bogus input result");
    STAssertNil(result, @"bogus input error");
}

-(void)test2
{
    
    PgMdAtomDateParser *dateParser = [[PgMdAtomDateParser alloc]init:@"en_US"];
    
    NSError *error = nil;
    
    NSDate *result = [dateParser parseRFC3339:@"2003-12-13T18:30:02Z":&error];            
    
    STAssertNil(error, @"bogus input result");
    STAssertNotNil(result, @"bogus input error");
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1071340202.0];
    STAssertEqualObjects(date, result, @"expected date value");  
}

@end
