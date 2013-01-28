//
//  PgMdAtomTextVisitorTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomTextVisitorTest.h"
#import "PgMdAtomTextVisitor.h"
#import "PgMdAtomText.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomParserAttributeImpl.h"
#import "PgMdAtomParserTextImpl.h"



@implementation PgMdAtomTextVisitorTest



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
    
    PgMdAtomParserElementImpl *rootElement = [[PgMdAtomParserElementImpl alloc]init];
    [rootElement setNodeName:@"root"];
    
    PgMdAtomParserElementImpl *childElement = [[PgMdAtomParserElementImpl alloc]init];
    [childElement setNodeName:@"child"];
    
    PgMdAtomParserTextImpl *textNode = [[PgMdAtomParserTextImpl alloc]init];
    [textNode setNodeValue:@"text1"];
    
    [childElement addChildNode:textNode];

    textNode = [[PgMdAtomParserTextImpl alloc]init];
    [textNode setNodeValue:@"text2"];

    [rootElement addChildNode:textNode];
    [rootElement addChildNode:childElement];

    
    PgMdAtomParserAttributeImpl *attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"nameOne"];
    [attribute setNodeValue:@"value1"];
    
    [rootElement addAttributeNode:attribute];
    
    
    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"nameTwo"];
    [attribute setNodeValue:@"value2"];
    
    [childElement addAttributeNode:attribute];
    
    PgMdAtomText *text = [[PgMdAtomText alloc]init];
    
    PgMdAtomTextVisitor *visitor = [[PgMdAtomTextVisitor alloc]init:text];
    
    [rootElement accept:visitor];
    
    
    STAssertEqualObjects(@"text2text1", text.text, @"expected text");
    STAssertEqualObjects(@"<root nameOne=\"value1\">text2<child nameTwo=\"value2\">text1</child></root>", text.markup, @"expected markup");



}

@end
