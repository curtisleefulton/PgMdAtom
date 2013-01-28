//
//  PgMdAtomPersonVisitorTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomPersonVisitorTest.h"
#import "PgMdAtomPersonVisitor.h"
#import "PgMdAtomPerson.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomParserTextImpl.h"

@implementation PgMdAtomPersonVisitorTest



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

    PgMdAtomParserElementImpl *personElement = [[PgMdAtomParserElementImpl alloc]init];
    [personElement setNodeName:@"person"];
    
    PgMdAtomParserElementImpl *childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"name"];
    PgMdAtomParserTextImpl *textNode = [[PgMdAtomParserTextImpl alloc]init];
    [textNode setNodeValue:@"nameValue"];
    [childElement addChildNode:textNode];
    [personElement addChildNode:childElement];

    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"email"];
    textNode = [[PgMdAtomParserTextImpl alloc]init];
    [textNode setNodeValue:@"emailValue"];
    [childElement addChildNode:textNode];
    [personElement addChildNode:childElement];

    childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"uri"];
    textNode = [[PgMdAtomParserTextImpl alloc]init];
    [textNode setNodeValue:@"urn:uri:value"];
    [childElement addChildNode:textNode];
    [personElement addChildNode:childElement];
    
    PgMdAtomPerson *person = [[PgMdAtomPerson alloc]init];
    
    PgMdAtomPersonVisitor *visitor = [[PgMdAtomPersonVisitor alloc]init:person];
    
    [personElement accept:visitor];
    
    STAssertEqualObjects(@"nameValue", person.name, @"person.name");
    STAssertEqualObjects(@"emailValue", person.email, @"person.email");
    STAssertEqualObjects([NSURL URLWithString:@"urn:uri:value"], person.uri, @"person.uri");
    
}

@end
