//
// Created by curtis.fulton on 3/2/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <UIKit/UIKit.h>
#import "PgMdAtomIntegrationTest.h"
#import "PgMdAtom.h"
#import "PgMdAtomLink.h"
#import "PgMdAtomEntry.h"


@implementation PgMdAtomIntegrationTest {

}


- (void)setUp {
    [super setUp];

    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.

    [super tearDown];
}

- (void)testDefaultFactory {

    id <PgMdAtomParser> parser = [PgMdAtom getParser];

    STAssertNotNil(parser, @"not nil");


}

- (void)testParseRFC4287Example1 {

    // example feed from http://www.ietf.org/rfc/rfc4287.txt
    NSString *xmlString = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
            "   <feed xmlns=\"http://www.w3.org/2005/Atom\">\n"
            "\n"
            "     <title>Example Feed</title>\n"
            "     <link href=\"http://example.org/\"/>\n"
            "     <updated>2003-12-13T18:30:02Z</updated>\n"
            "     <author>\n"
            "       <name>John Doe</name>\n"
            "     </author>\n"
            "     <id>urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6</id>\n"
            "\n"
            "     <entry>\n"
            "       <title>Atom-Powered Robots Run Amok</title>\n"
            "       <link href=\"http://example.org/2003/12/13/atom03\"/>\n"
            "       <id>urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a</id>\n"
            "       <updated>2003-12-13T18:30:02Z</updated>\n"
            "       <summary>Some text.</summary>\n"
            "     </entry>\n"
            "\n"
            "   </feed>";

    NSData *xmlData = [xmlString dataUsingEncoding:NSUTF8StringEncoding];


    id <PgMdAtomParser> parser = [PgMdAtom getParser];

    NSError *error = nil;
    PgMdAtomFeed *feed = [parser parse:@"en_US" :xmlData :&error];

    STAssertNil(error, @"no error");
    STAssertNotNil(feed, @"have feed");

    STAssertEqualObjects(feed.title.text, @"Example Feed", @"title was parsed correctly");
    STAssertEquals((int) [feed.links count], 1, @"expected link count");
    STAssertEqualObjects(((PgMdAtomLink *) feed.links[0]).href, [[NSURL alloc] initWithString:@"http://example.org/"], @"link was parsed correctly");
    STAssertEquals(feed.updated.timeIntervalSince1970, (NSTimeInterval) 1071340202, @"updated was parsed correctly");
    STAssertEqualObjects(((PgMdAtomPerson *) feed.authors[0]).name, @"John Doe", @"author name was parsed correctly");
    STAssertEqualObjects(feed.atomId, [[NSURL alloc] initWithString:@"urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6"], @"id was parsed correctly");


    STAssertEquals((int) [feed.entries count], 1, @"expected entries count");
    STAssertEqualObjects(((PgMdAtomEntry *) feed.entries[0]).title.text, @"Atom-Powered Robots Run Amok", @"entry title was parsed correctly");
    STAssertEquals((int) [((PgMdAtomEntry *) feed.entries[0]).links count], 1, @"expected entry link count");
    STAssertEqualObjects(((PgMdAtomLink *) ((PgMdAtomEntry *) feed.entries[0]).links[0]).href, [[NSURL alloc] initWithString:@"http://example.org/2003/12/13/atom03"], @"entry link was parsed correctly");
    STAssertEqualObjects(((PgMdAtomEntry *) feed.entries[0]).atomId, [[NSURL alloc] initWithString:@"urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a"], @"entry id was parsed correctly");
    STAssertEquals(((PgMdAtomEntry *) feed.entries[0]).updated.timeIntervalSince1970, (NSTimeInterval) 1071340202, @"entry updated was parsed correctly");
    STAssertEqualObjects(((PgMdAtomEntry *) feed.entries[0]).summary.text, @"Some text.", @"entry summary was parsed correctly");


}


- (void)testParseRFC4287Example2
{

    // example feed from http://www.ietf.org/rfc/rfc4287.txt
    NSString *xmlString = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
            "   <feed xmlns=\"http://www.w3.org/2005/Atom\">\n"
            "     <title type=\"text\">dive into mark</title>\n"
            "     <subtitle type=\"html\">\n"
            "       A &lt;em&gt;lot&lt;/em&gt; of effort\n"
            "       went into making this effortless\n"
            "     </subtitle>\n"
            "     <updated>2005-07-31T12:29:29Z</updated>\n"
            "     <id>tag:example.org,2003:3</id>\n"
            "     <link rel=\"alternate\" type=\"text/html\"\n"
            "      hreflang=\"en\" href=\"http://example.org/\"/>\n"
            "     <link rel=\"self\" type=\"application/atom+xml\"\n"
            "      href=\"http://example.org/feed.atom\"/>\n"
            "     <rights>Copyright (c) 2003, Mark Pilgrim</rights>\n"
            "     <generator uri=\"http://www.example.com/\" version=\"1.0\">\n"
            "       Example Toolkit\n"
            "     </generator>\n"
            "     <entry>\n"
            "       <title>Atom draft-07 snapshot</title>\n"
            "       <link rel=\"alternate\" type=\"text/html\"\n"
            "        href=\"http://example.org/2005/04/02/atom\"/>\n"
            "       <link rel=\"enclosure\" type=\"audio/mpeg\" length=\"1337\"\n"
            "        href=\"http://example.org/audio/ph34r_my_podcast.mp3\"/>\n"
            "       <id>tag:example.org,2003:3.2397</id>\n"
            "       <updated>2005-07-31T12:29:29Z</updated>\n"
            "       <published>2003-12-13T08:29:29-04:00</published>\n"
            "       <author>\n"
            "         <name>Mark Pilgrim</name>\n"
            "         <uri>http://example.org/</uri>\n"
            "         <email>f8dy@example.com</email>\n"
            "       </author>\n"
            "       <contributor>\n"
            "         <name>Sam Ruby</name>\n"
            "       </contributor>\n"
            "       <contributor>\n"
            "         <name>Joe Gregorio</name>\n"
            "       </contributor>\n"
            "       <content type=\"xhtml\" xml:lang=\"en\"\n"
            "        xml:base=\"http://diveintomark.org/\">\n"
            "         <div xmlns=\"http://www.w3.org/1999/xhtml\">\n"
            "           <p><i>[Update: The Atom draft is finished.]</i></p>\n"
            "         </div>\n"
            "       </content>\n"
            "     </entry>\n"
            "   </feed>";

    NSData *xmlData = [xmlString dataUsingEncoding:NSUTF8StringEncoding];


    id <PgMdAtomParser> parser = [PgMdAtom getParser];

    NSError *error = nil;
    PgMdAtomFeed *feed = [parser parse:@"en_US" :xmlData :&error];

    STAssertNil(error, @"no error");
    STAssertNotNil(feed, @"have feed");

    STAssertEquals((int) [feed.entries count], 1, @"expected entries count");

    STAssertEqualObjects(((PgMdAtomEntry *) feed.entries[0]).content.markup,@"<content xml:lang=\"en\" type=\"xhtml\" xml:base=\"http://diveintomark.org/\">\n"
            "         <div xmlns=\"http://www.w3.org/1999/xhtml\">\n"
            "           <p><i>[Update: The Atom draft is finished.]</i></p>\n"
            "         </div>\n"
            "       </content>", @"entry content has expected markup");




}

@end