//
//  PgMdAtomParserDefaultImpl.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/6/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomParserDefaultImpl.h"
#import "PgMdAtomCoreParser.h"
#import "PgMdAtomFeedVisitor.h"

@implementation PgMdAtomParserDefaultImpl

-(PgMdAtomFeed*)parse:(NSString*)locale:(NSData *)xml:(NSError**)error
{
    PgMdAtomCoreParser *coreParser = [[PgMdAtomCoreParser alloc]init];

    BOOL success = [coreParser parse:xml :error];
    
    if(!success)
        return nil;
    
    id<PgMdAtomNode> rootElement = [coreParser getRootElement];
    
    PgMdAtomFeed *feed = [[PgMdAtomFeed alloc]init];
    feed.entries = [[NSArray alloc]init];

    
    PgMdAtomFeedVisitor *feedVisitor = [[PgMdAtomFeedVisitor alloc]init:locale:feed];
    
    [rootElement accept:feedVisitor];
    
    
    
    return feed;

    
}

@end
