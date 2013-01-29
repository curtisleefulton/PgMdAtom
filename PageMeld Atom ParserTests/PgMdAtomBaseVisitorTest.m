//
//  PgMdAtomBaseVisitorTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomBaseVisitorTest.h"
#import "PgMdAtomBaseVisitor.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomParserTextImpl.h"

@implementation PgMdAtomBaseVisitorTest

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

-(void)testExpectedDefaults
{
    PgMdAtomBase *atomBase = [[PgMdAtomBase alloc]init];
    
    STAssertNil(atomBase.atomId, @"id nil");
    STAssertNil(atomBase.title, @"title nil");
    STAssertNil(atomBase.updated, @"updated nil");
    STAssertNil(atomBase.categories, @"categories nil");
    STAssertNil(atomBase.rights, @"rights nil");
    STAssertNil(atomBase.authors, @"author nil");
    STAssertNil(atomBase.contributors, @"contributor nil");
    STAssertNil(atomBase.links, @"contributor nil");
}


-(void)testVisitedDefaults
{
    
    PgMdAtomParserElementImpl *feedElement = [[PgMdAtomParserElementImpl alloc]init];
    [feedElement setNodeName:@"feed"];
    
    PgMdAtomBase *atomBase = [[PgMdAtomBase alloc]init];
    
    PgMdAtomBaseVisitor *visitor = [[PgMdAtomBaseVisitor alloc]init:@"en_US":atomBase];
    
    [feedElement accept:visitor];
    
    STAssertNil(atomBase.atomId, @"id nil");
    STAssertNil(atomBase.title, @"title nil");
    STAssertNil(atomBase.updated, @"updated nil");
    STAssertNotNil(atomBase.categories, @"categories nil");
    STAssertEquals(0, (int)[atomBase.categories count], @"categories count");
    STAssertNil(atomBase.rights, @"rights nil");
    STAssertNotNil(atomBase.authors, @"author not nil");
    STAssertEquals(0, (int)[atomBase.authors count], @"authors count");
    STAssertNotNil(atomBase.contributors, @"contributor nil");
    STAssertEquals(0, (int)[atomBase.contributors count], @"contributors count");
    STAssertNotNil(atomBase.links, @"contributor nil");
    STAssertEquals(0, (int)[atomBase.links count], @"links count");
}

-(void)testVisted
{
    
    
    PgMdAtomParserElementImpl *entryElement = [[PgMdAtomParserElementImpl alloc]init];
    [entryElement setNodeName:@"entry"];
    
    PgMdAtomParserElementImpl *childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"id"];
    [entryElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"title"];
    [entryElement addChildNode:childElement];
        
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"author"];
    [entryElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"link"];
    [entryElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"category"];
    [entryElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"contributor"];
    [entryElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"rights"];
    [entryElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"updated"];
    PgMdAtomParserTextImpl *textNode = [[PgMdAtomParserTextImpl alloc]init];
    [textNode setNodeValue:@"2003-12-13T18:30:02Z"];
    [childElement addChildNode:textNode];
    [entryElement addChildNode:childElement];
    
    
    PgMdAtomBase *atomBase = [[PgMdAtomBase alloc]init];
    
    PgMdAtomBaseVisitor *visitor = [[PgMdAtomBaseVisitor alloc]init:@"en_US":atomBase];
    
    [entryElement accept:visitor];
    
    
    STAssertNotNil(atomBase.atomId, @"id not nil");
    STAssertNotNil(atomBase.title, @"title not nil");
    STAssertNotNil(atomBase.updated, @"updated not nil");
    STAssertNotNil(atomBase.categories, @"categories not nil");
    STAssertEquals(1, (int)[atomBase.categories count], @"categories count");
    STAssertNotNil(atomBase.rights, @"rights not nil");
    STAssertNotNil(atomBase.authors, @"author not nil");
    STAssertEquals(1, (int)[atomBase.authors count], @"authors count");
    STAssertNotNil(atomBase.contributors, @"contributor not nil");
    STAssertEquals(1, (int)[atomBase.contributors count], @"contributors count");
    STAssertNotNil(atomBase.links, @"contributor not nil");
    STAssertEquals(1, (int)[atomBase.links count], @"links count");
}

@end
