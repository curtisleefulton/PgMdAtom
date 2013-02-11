//
//  PgMdAtomFeedVisitorTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomFeedVisitorTest.h"
#import "PgMdAtomFeedVisitor.h"
#import "PgMdAtomParserElementImpl.h"

@implementation PgMdAtomFeedVisitorTest



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

-(void)testFeedExpectedDefaults
{
    PgMdAtomFeed *feed = [[PgMdAtomFeed alloc]init];
    
    STAssertNil(feed.entries, @"entries nil");
}

-(void)testFeedVistedExpectedDefaults
{
    
    PgMdAtomParserElementImpl *feedElement = [[PgMdAtomParserElementImpl alloc]init];
    [feedElement setNodeName:@"feed"];
    
    PgMdAtomFeed *feed = [[PgMdAtomFeed alloc]init];
    
    PgMdAtomFeedVisitor *visitor = [[PgMdAtomFeedVisitor alloc]init:@"en_US" :feed ];
    
    [feedElement accept:visitor];
    
    
    STAssertNotNil(feed.entries, @"entries not nil");
    STAssertEquals(0, (int)[feed.entries count], @"expected entry count");

    
}

-(void)testFeedVistedExpectedResults
{
    
    PgMdAtomParserElementImpl *feedElement = [[PgMdAtomParserElementImpl alloc]init];
    [feedElement setNodeName:@"feed"];
    
    
    PgMdAtomParserElementImpl *childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"entry"];
    [feedElement addChildNode:childElement];
    
    
    PgMdAtomFeed *feed = [[PgMdAtomFeed alloc]init];
    
    PgMdAtomFeedVisitor *visitor = [[PgMdAtomFeedVisitor alloc]init:@"en_US" :feed ];
    
    [feedElement accept:visitor];
    
    
    STAssertNotNil(feed.entries, @"entries not nil");
    STAssertEquals(1, (int)[feed.entries count], @"expected entry count");
    
    
}

@end
