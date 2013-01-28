//
//  PgMdAtomTextAcumulatorVisitorTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomTextAcumulatorVisitorTest.h"
#import "PgMdAtomTextAcumulatorVisitor.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomParserTextImpl.h"

@implementation PgMdAtomTextAcumulatorVisitorTest


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
    
    NSMutableArray *text = [[NSMutableArray alloc]init];
    
    PgMdAtomTextAcumulatorVisitor *textAcumulatorVisitor = [[PgMdAtomTextAcumulatorVisitor alloc]init:text];
        
    PgMdAtomParserElementImpl *parserElement = [[PgMdAtomParserElementImpl alloc]init];
    
    PgMdAtomParserTextImpl *parserText = [[PgMdAtomParserTextImpl alloc]init];
    [parserText setNodeValue:@"one"];
    [parserElement addChildNode:parserText];
    
    parserText = [[PgMdAtomParserTextImpl alloc]init];
    [parserText setNodeValue:@"two"];
    [parserElement addChildNode:parserText];
    
    parserText = [[PgMdAtomParserTextImpl alloc]init];
    [parserText setNodeValue:@"three"];
    [parserElement addChildNode:parserText];
    
    [textAcumulatorVisitor visitElement:parserElement];
    
    STAssertEquals(3, (int)[text count], @"text array length");
    STAssertEqualObjects(@"one,two,three", [text componentsJoinedByString:@","], @"text value");


    
    
    
}

@end
