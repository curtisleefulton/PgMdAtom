//
//  PgMdAtomParserElementImplTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomNodeVisitTest.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomNodeVisitorTestImpl.h"
#import "PgMdAtomParserTextImpl.h"
#import "PgMdAtomParserAttributeImpl.h"

@implementation PgMdAtomNodeVisitTest


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

-(void)testElementVisits
{
    PgMdAtomParserElementImpl *parser = [[PgMdAtomParserElementImpl alloc]init];
    
    PgMdAtomNodeVisitorTestImpl *nodeVisitorTestImpl = [[PgMdAtomNodeVisitorTestImpl alloc]init];
    
    [parser accept:nodeVisitorTestImpl];
    
    NSArray *visits = [nodeVisitorTestImpl getVisits];
    
    STAssertEquals(2, (int)[visits count], @"expected visits");
    
    STAssertEqualObjects(@"element", [visits objectAtIndex:0], @"");
    STAssertEqualObjects(@"elementClose", [visits objectAtIndex:1], @"");

}

-(void)testTextVisits
{
    PgMdAtomParserTextImpl *parser = [[PgMdAtomParserTextImpl alloc]init];
    
    PgMdAtomNodeVisitorTestImpl *nodeVisitorTestImpl = [[PgMdAtomNodeVisitorTestImpl alloc]init];
    
    [parser accept:nodeVisitorTestImpl];
    
    NSArray *visits = [nodeVisitorTestImpl getVisits];
    
    STAssertEquals(1, (int)[visits count], @"expected visits");
    
    STAssertEqualObjects(@"text", [visits objectAtIndex:0], @"");
    
}

-(void)testAttributeVisits
{
    PgMdAtomParserAttributeImpl *parser = [[PgMdAtomParserAttributeImpl alloc]init];
    
    PgMdAtomNodeVisitorTestImpl *nodeVisitorTestImpl = [[PgMdAtomNodeVisitorTestImpl alloc]init];
    
    [parser accept:nodeVisitorTestImpl];
    
    NSArray *visits = [nodeVisitorTestImpl getVisits];
    
    STAssertEquals(1, (int)[visits count], @"expected visits");
    
    STAssertEqualObjects(@"attribute", [visits objectAtIndex:0], @"");
    
}

@end
