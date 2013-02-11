//
//  PgMdAtomGeneratorVisitorTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomGeneratorVisitorTest.h"
#import "PgMdAtomGeneratorVisitor.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomParserAttributeImpl.h"

@implementation PgMdAtomGeneratorVisitorTest


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
    
    PgMdAtomParserElementImpl *generatorElement = [[PgMdAtomParserElementImpl alloc]init];
    [generatorElement setNodeName:@"generator"];
    
    PgMdAtomParserAttributeImpl *attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"uri"];
    [attribute setNodeValue:@"urn:uri:value"];
    [generatorElement addAttributeNode:attribute];
    
    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"version"];
    [attribute setNodeValue:@"versionValue"];
    [generatorElement addAttributeNode:attribute];
    
    PgMdAtomGenerator *generator = [PgMdAtomGenerator alloc];
    
    PgMdAtomGeneratorVisitor *visitor = [[PgMdAtomGeneratorVisitor alloc]init:generator ];
    
    [generatorElement accept:visitor];
    
    STAssertEqualObjects([NSURL URLWithString:@"urn:uri:value"], generator.uri, @"generator.uri");
    STAssertEqualObjects(@"versionValue", generator.version, @"generator.value");
    
    
    
}

@end
