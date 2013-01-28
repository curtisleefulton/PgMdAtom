//
//  VTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomLinkVisitorTest.h"
#import "PgMdAtomLinkVisitor.h"
#import "PgMdAtomParserAttributeImpl.h"

@implementation PgMdAtomLinkVisitorTest


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
    PgMdAtomLink *link = [[PgMdAtomLink alloc]init];
    
    PgMdAtomLinkVisitor *linkVisitor = [[PgMdAtomLinkVisitor alloc]init:link];
    
    
    PgMdAtomParserAttributeImpl *attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"bogusName"];
    [attribute setNodeValue:@"bogusValue"];
    [linkVisitor visitAttribute:attribute];
    
    
    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"href"];
    [attribute setNodeValue:@"urn:href:value"];
    [linkVisitor visitAttribute:attribute];
    
    
    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"rel"];
    [attribute setNodeValue:@"relValue"];
    [linkVisitor visitAttribute:attribute];
    
    
    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"type"];
    [attribute setNodeValue:@"typeValue"];
    [linkVisitor visitAttribute:attribute];
    
    
    
    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"hreflang"];
    [attribute setNodeValue:@"hreflangValue"];
    [linkVisitor visitAttribute:attribute];
    
    
    
    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"title"];
    [attribute setNodeValue:@"titleValue"];
    [linkVisitor visitAttribute:attribute];
    
    
    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"length"];
    [attribute setNodeValue:@"1234"];
    [linkVisitor visitAttribute:attribute];
    
    
    
    STAssertEqualObjects([NSURL URLWithString:@"urn:href:value"], link.href, @"link.href");
    
    STAssertEqualObjects(@"relValue", link.rel, @"link.rel");
    
    STAssertEqualObjects(@"typeValue", link.type, @"link.type");
    
    STAssertEqualObjects(@"hreflangValue", link.hreflang, @"link.hreflang");

    STAssertEqualObjects(@"titleValue", link.title, @"link.title");
    
    STAssertEquals(1234, link.length, @"link.length");    
    
    
}

@end
