//
//  PgMdAtomSourceVisitorTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomSourceVisitorTest.h"
#import "PgMdAtomSourceVisitor.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomParserTextImpl.h"

@implementation PgMdAtomSourceVisitorTest



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

-(void)testSourceExpectedDefaults
{
    PgMdAtomSource *source = [[PgMdAtomSource alloc]init];
    
    STAssertNil(source.subTitle, @"subTitle nil");
    STAssertNil(source.icon, @"icon nil");
    STAssertNil(source.logo, @"logo nil");
    STAssertNil(source.generator, @"generator nil");
}

-(void)testSourceVistedExpectedDefaults
{
    
    PgMdAtomParserElementImpl *feedElement = [[PgMdAtomParserElementImpl alloc]init];
    [feedElement setNodeName:@"feed"];
    
    PgMdAtomSource *source = [[PgMdAtomSource alloc]init];
    
    PgMdAtomSourceVisitor *visitor = [[PgMdAtomSourceVisitor alloc]init:@"en_US" :source ];
    
    [feedElement accept:visitor];
    
    STAssertNil(source.subTitle, @"subTitle nil");
    STAssertNil(source.icon, @"icon nil");
    STAssertNil(source.logo, @"logo nil");
    STAssertNil(source.generator, @"generator nil");
    
}

-(void)testSourceVistedExpectedResults
{
    
    PgMdAtomParserElementImpl *feedElement = [[PgMdAtomParserElementImpl alloc]init];
    [feedElement setNodeName:@"feed"];
    
    
    
    PgMdAtomParserElementImpl *childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"subtitle"];
    [feedElement addChildNode:childElement];
    
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"icon"];
    [feedElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"logo"];
    [feedElement addChildNode:childElement];
    
    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"generator"];
    [feedElement addChildNode:childElement];
    
    
    PgMdAtomSource *source = [[PgMdAtomSource alloc]init];
    
    PgMdAtomSourceVisitor *visitor = [[PgMdAtomSourceVisitor alloc]init:@"en_US" :source ];
    
    [feedElement accept:visitor];
    
    
    STAssertNotNil(source.subTitle, @"subTitle nil");
    STAssertNotNil(source.icon, @"icon nil");
    STAssertNotNil(source.logo, @"logo nil");
    STAssertNotNil(source.generator, @"generator nil");
    
    
}

@end
