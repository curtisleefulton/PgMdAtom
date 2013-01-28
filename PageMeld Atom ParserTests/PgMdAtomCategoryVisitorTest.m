//
//  PgMdAtomCategoryVisitorTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomCategoryVisitorTest.h"
#import "PgMdAtomCategoryVisitor.h"
#import "PgMdAtomParserAttributeImpl.h"

@implementation PgMdAtomCategoryVisitorTest


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

- (void)test1
{
    PgMdAtomCategory *category = [[PgMdAtomCategory alloc]init];
      
    PgMdAtomCategoryVisitor *categoryVisitor = [[PgMdAtomCategoryVisitor alloc]init:category];
    
    PgMdAtomParserAttributeImpl *attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"bogusName"];
    [attribute setNodeValue:@"bogusValue"];
    [categoryVisitor visitAttribute:attribute];

    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"scheme"];
    [attribute setNodeValue:@"urn:scheme:value"];
    [categoryVisitor visitAttribute:attribute];
    

    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"label"];
    [attribute setNodeValue:@"labelValue"];
    [categoryVisitor visitAttribute:attribute];
    
    attribute = [[PgMdAtomParserAttributeImpl alloc]init];
    [attribute setNodeName:@"term"];
    [attribute setNodeValue:@"termValue"];
    [categoryVisitor visitAttribute:attribute];
    
       
    STAssertEqualObjects([NSURL URLWithString:@"urn:scheme:value"], category.scheme, @"category.scheme");
    
    STAssertEqualObjects(@"labelValue", category.label, @"category.scheme");

    STAssertEqualObjects(@"termValue", category.term, @"category.term");    
}



@end
