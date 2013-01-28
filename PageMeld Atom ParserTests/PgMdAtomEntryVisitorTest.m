//
//  PgMdAtomEntryVisitorTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomEntryVisitorTest.h"
#import "PgMdAtomEntryVisitor.h"
#import "PgMdAtomEntry.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomParserTextImpl.h"


@implementation PgMdAtomEntryVisitorTest



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

-(void)testEntryExpectedDefaults
{
    PgMdAtomEntry *entry = [[PgMdAtomEntry alloc]init];
    
    STAssertNil(entry.published, @"published nil");
    STAssertNil(entry.content, @"content nil");
    STAssertNil(entry.summary, @"summary nil");
    STAssertNil(entry.source, @"source nil");

    
}

-(void)testEntryVistedExpectedDefaults
{
    
    PgMdAtomParserElementImpl *entryElement = [[PgMdAtomParserElementImpl alloc]init];
    [entryElement setNodeName:@"entry"];
    
    PgMdAtomEntry *entry = [[PgMdAtomEntry alloc]init];
    
    PgMdAtomEntryVisitor *visitor = [[PgMdAtomEntryVisitor alloc]init:@"en_US" :entry ];
    
    [entryElement accept:visitor];
    
    STAssertNil(entry.published, @"published nil");
    STAssertNil(entry.content, @"content nil");
    STAssertNil(entry.summary, @"summary nil");
    STAssertNil(entry.source, @"source nil");

}

-(void)testEntryVistedExpectedResults
{
    
    PgMdAtomParserElementImpl *entryElement = [[PgMdAtomParserElementImpl alloc]init];
    [entryElement setNodeName:@"entry"];
    
   
   
    PgMdAtomParserElementImpl *childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"published"];
    PgMdAtomParserTextImpl *textNode = [[PgMdAtomParserTextImpl alloc]init];
    [textNode setNodeValue:@"2003-12-13T18:30:02Z"];
    [childElement addChildNode:textNode];
    [entryElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"content"];
    [entryElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"summary"];
    [entryElement addChildNode:childElement];
             
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"source"];
    [entryElement addChildNode:childElement];
    
    
    PgMdAtomEntry *entry = [[PgMdAtomEntry alloc]init];
    
    PgMdAtomEntryVisitor *visitor = [[PgMdAtomEntryVisitor alloc]init:@"en_US" :entry ];
    
    [entryElement accept:visitor];
    
    
    STAssertNotNil(entry.published, @"published not nil");
    STAssertNotNil(entry.content, @"content not nil");
    STAssertNotNil(entry.summary, @"summary not nil");
    STAssertNotNil(entry.source, @"source not nil");

}

@end
