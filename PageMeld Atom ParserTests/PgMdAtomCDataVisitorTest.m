//
// Created by curtis.fulton on 2/9/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PgMdAtomCDataVisitorTest.h"
#import "PgMdAtomTextVisitor.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomParserCDataImpl.h"



@implementation PgMdAtomCDataVisitorTest



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


    PgMdAtomParserCDataImpl *cdataNode = [[PgMdAtomParserCDataImpl alloc]init];
    [cdataNode setNodeValue:@"<markup/>"];


    [rootElement addChildNode:cdataNode];




    PgMdAtomText *text = [[PgMdAtomText alloc]init];

    PgMdAtomTextVisitor *visitor = [[PgMdAtomTextVisitor alloc]init:text];

    [rootElement accept:visitor];


    STAssertEqualObjects(@"<markup/>", text.text, @"expected cdata");
    STAssertEqualObjects(@"<root><![CDATA[<markup/>]]></root>", text.markup, @"expected markup");




}

@end