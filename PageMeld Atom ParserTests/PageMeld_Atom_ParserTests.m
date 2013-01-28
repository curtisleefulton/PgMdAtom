//
//  PageMeld_Atom_ParserTests.m
//  PageMeld Atom ParserTests
//
//  Created by Curtis Fulton on 12/3/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PageMeld_Atom_ParserTests.h"
#import "PgMdAtomCoreParser.h"
#import "PgMdAtomFeedVisitor.h"
#import "PgMdAtomEntry.h"
#import "PgMdAtomNode.h"
#import "PgMdAtomLink.h"
#import "PgMdAtomCategory.h"


@implementation PageMeld_Atom_ParserTests

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

- (void)testSimpleFeed
{
    PgMdAtomCoreParser *coreParser = [[PgMdAtomCoreParser alloc]init];
    
    NSString* xmlString = @"<xml><id>urn:pagemeld:root</id><title>hello</title><updated>2003-12-13T18:30:02Z</updated><category scheme=\"urn:pagemeld:feed:type\" term=\"index\" label=\"label\"/><entry><id>urn:pagemeld:entry</id><updated>2002-10-13T18:30:02Z</updated><summary type=\"html\">summary <b>markup</b></summary><link href=\"urn:entry:link\"/><content type=\"html\">content string</content><title>entryTitle</title><category scheme=\"urn:pagemeld:entry:type\" term=\"term\" label=\"label\"/>/></entry><entry><content><div style=\"color:red\"><br/><p style=\"color:blue\" class=\"className\">hello<b>world</b><span>HELLO<i>WORLD</i></span></p></div></content></entry></xml>";
    NSData *xmlData  = [xmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    BOOL success = [coreParser parse:xmlData :&error];
    id<PgMdAtomNode> rootElement = [coreParser getRootElement];
    
    
        
    PgMdAtomFeed *feed = [[PgMdAtomFeed alloc]init];
    feed.entries = [[NSArray alloc]init];
    
    PgMdAtomFeedVisitor *feedVisitor = [[PgMdAtomFeedVisitor alloc]init:@"en_US":feed];
    
    [rootElement accept:feedVisitor];
    
    

    STAssertTrue(success, @"parse success");

    STAssertNil(error, @"parse success");
    
    STAssertNotNil(feed, @"");

    
    STAssertEqualObjects(@"hello", feed.title.text, @"");
    STAssertEqualObjects([[NSURL alloc]initWithString:@"urn:pagemeld:root"], feed.atomId, @"");
    
    int c = [feed.entries count];
    
    
    
    STAssertEquals(2,c,@"");
    
    c = [feed.categories count];
    
    STAssertEquals(1,c,@"");
    
    PgMdAtomEntry *entry = [feed.entries objectAtIndex:0];
    
    PgMdAtomLink *link = [entry.links objectAtIndex:0];
    
    
    PgMdAtomCategory *category = [feed.categories objectAtIndex:0];

    STAssertEqualObjects([[NSURL alloc]initWithString:@"urn:pagemeld:feed:type"], category.scheme, @"");
    
    STAssertEqualObjects(@"index", category.term, @"");
    
    STAssertEqualObjects(@"label", category.label, @"");



    
    STAssertEqualObjects([[NSURL alloc]initWithString:@"urn:entry:link"], link.href, @"");

    
    STAssertEqualObjects([[NSURL alloc]initWithString:@"urn:pagemeld:entry"], entry.atomId, @"");

    
    STAssertEqualObjects(@"entryTitle", entry.title.text, @"");
    
    STAssertEqualObjects(@"html", entry.content.type, @"");
    
    STAssertEqualObjects(@"content string", entry.content.text, @"");
    
    STAssertEqualObjects(@"html", entry.summary.type, @"");
    
    STAssertEqualObjects(@"summary markup", entry.summary.text, @"");
    
    STAssertEqualObjects(@"<summary type=\"html\">summary <b>markup</b></summary>", entry.summary.markup, @"");


    
    STAssertEqualObjects(@"2003-12-13 18:30:02 +0000",feed.updated.description, @"parsed updated");
    
    STAssertEqualObjects(@"2002-10-13 18:30:02 +0000",entry.updated.description, @"parsed updated");
    
    c = [entry.categories count];
    STAssertEquals(1,c, @"entry categories count");

    
    PgMdAtomCategory *entryCategory = [entry.categories objectAtIndex:0];
    
    STAssertEqualObjects(@"label", entryCategory.label, @"entry category label");
    
    STAssertEqualObjects(@"term", entryCategory.term, @"entry category term");
    
    STAssertEqualObjects([[NSURL alloc]initWithString:@"urn:pagemeld:entry:type"], entryCategory.scheme, @"entry category scheme");





    PgMdAtomEntry *entry2 = [feed.entries objectAtIndex:1];
    
    STAssertEqualObjects(@"helloworldHELLOWORLD", entry2.content.text, @"");
    
    STAssertEqualObjects(@"<content><div style=\"color:red\"><br></br><p style=\"color:blue\" class=\"className\">hello<b>world</b><span>HELLO<i>WORLD</i></span></p></div></content>", entry2.content.markup, @"");

    




    
    
    
}



- (void)testBadFeed
{
    PgMdAtomCoreParser *coreParser = [[PgMdAtomCoreParser alloc]init];
    
    NSString* xmlString = @"not xml";
    NSData *xmlData  = [xmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    BOOL success = [coreParser parse:xmlData :&error];
    
    STAssertFalse(success, @"");
    STAssertNotNil(error, @"");
    
 
}

@end
