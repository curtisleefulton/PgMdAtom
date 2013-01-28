//
//  PgMdAtomCoreParserTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomCoreParserTest.h"
#import "PgMdAtomCoreParser.h"

@implementation PgMdAtomCoreParserTest


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
    PgMdAtomCoreParser *parser = [[PgMdAtomCoreParser alloc]init];
    
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"valueOne",
                                @"nameOne",
                                @"valueTwo",
                                @"nameTwo",
                                nil
                                ];
                                

    [parser parser:nil didStartElement:@"feed" namespaceURI:@"" qualifiedName:@"" attributes:attributes];
    
    attributes = [[NSDictionary alloc]init];
    [parser parser:nil didStartElement:@"title" namespaceURI:@"" qualifiedName:@"" attributes:attributes];
    
    [parser parser:nil foundCharacters:@"titleText1"];
    [parser parser:nil foundCharacters:@"titleText2"];

    [parser parser:nil didEndElement:@"title" namespaceURI:@"" qualifiedName:@""];
    
    [parser parser:nil didEndElement:@"feed" namespaceURI:@"" qualifiedName:@""];
    
    
    id<PgMdAtomNode> root = [parser getRootElement];
    
    NSArray *rootAttributeNodes = [root getAttributeNodes];
    NSArray *rootChildNodes = [root getChildNodes];
    
    STAssertEqualObjects(@"feed", [root getNodeName], @"");

    STAssertEquals(1, (int)[rootChildNodes count], @"root child nodes");

    STAssertEquals(2, (int)[rootAttributeNodes count], @"root attributes");

    id<PgMdAtomNode> rootAttribute1 = [rootAttributeNodes objectAtIndex:0];
    id<PgMdAtomNode> rootAttribute2 = [rootAttributeNodes objectAtIndex:1];
    
    id<PgMdAtomNode> titleNode = [rootChildNodes objectAtIndex:0];

    NSArray *titleChildNodes = [titleNode getChildNodes];
    id<PgMdAtomNode> titleChildNode1 = [titleChildNodes objectAtIndex:0];
    id<PgMdAtomNode> titleChildNode2 = [titleChildNodes objectAtIndex:1];

    
    STAssertEqualObjects(@"nameOne", [rootAttribute1 getNodeName], @"");
    STAssertEqualObjects(@"valueOne", [rootAttribute1 getNodeValue], @"");

    
    STAssertEqualObjects(@"nameTwo", [rootAttribute2 getNodeName], @"");
    STAssertEqualObjects(@"valueTwo", [rootAttribute2 getNodeValue], @"");
        

    STAssertEqualObjects(@"title", [titleNode getNodeName], @"");


    STAssertEquals(2, (int)[titleChildNodes count], @"title children");
    
    
    STAssertEqualObjects(@"titleText1", [titleChildNode1 getNodeValue], @"");
    STAssertEqualObjects(@"titleText2", [titleChildNode2 getNodeValue], @"");


}

@end
