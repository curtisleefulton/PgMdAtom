//
//  PgMdAtomNodeVisitorDefaultImpl.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/3/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomFeedVisitor.h"
#import "PgMdAtomEntryVisitor.h"

@implementation PgMdAtomFeedVisitor
{
@private PgMdAtomFeed __weak *_feed;
@private NSMutableArray *_entries;
    
}

-(id)init:(NSString*)locale:(PgMdAtomFeed*)feed
{
    self = [super init:locale:feed];
    if(self)
    {
        _feed = feed;
        _entries = [NSMutableArray array];
        
    }
    return self;
}

- (void)visitElement:(id<PgMdAtomNode>)elementNode
{
    [super visitElement:elementNode];
    

    
    _feed.entries = _entries;


    
}

-(void)_processElement:(id<PgMdAtomNode>)child
{
    [super _processElement:child];
    
    if([@"entry" isEqualToString:[child getNodeName]])
    {
        PgMdAtomEntry *entry = [[PgMdAtomEntry alloc]init];
        
        PgMdAtomEntryVisitor *visitor = [[PgMdAtomEntryVisitor alloc]init:_locale:entry];
        
        [child accept:visitor];
        
        
        [_entries addObject:entry];
        
        
    }
    
}

-(void)dealloc
{
    _entries = nil;
}




@end
