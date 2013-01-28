//
//  PgMdAtomParserNodeImplTest.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomParserNodeImplTest.h"
#import "PgMdAtomParserNodeImpl.h"

@implementation PgMdAtomParserNodeImplTest

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
    PgMdAtomParserNodeImpl *parentNode = [[PgMdAtomParserNodeImpl alloc]init];

    PgMdAtomParserNodeImpl *childNode = [[PgMdAtomParserNodeImpl alloc]init];

    
    [parentNode setNodeName:@"name"];
    [parentNode setNodeValue:@"value"];
    
    [parentNode addChildNode:childNode];
    [parentNode addAttributeNode:childNode];
    
    
    STAssertEqualObjects(@"name", [parentNode getNodeName], @"node name");
    STAssertEqualObjects(@"value", [parentNode getNodeValue], @"node value");
    
    
    STAssertEqualObjects(parentNode, [childNode getParentNode], @"parent node");
    
    
    NSArray *childNodes = [parentNode getChildNodes];
    
    NSArray *attrNodes = [parentNode getAttributeNodes];
    
    
    STAssertEquals(1, (int)[childNodes count], @"child node size");
    
    STAssertEquals(1, (int)[attrNodes count], @"attributes  size");
    
    
    STAssertEqualObjects(childNode, [childNodes objectAtIndex:0], @"child node");
    
    STAssertEqualObjects(childNode, [attrNodes objectAtIndex:0], @"attribute node");





    

}
@end
