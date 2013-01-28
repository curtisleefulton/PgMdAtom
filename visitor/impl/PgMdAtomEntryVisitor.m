//
//  PgMdAtomVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomEntryVisitor.h"
#import "PgMdAtomTextAcumulatorVisitor.h"
#import "PgMdAtomTextVisitor.h"
#import "PgMdAtomSourceVisitor.h"

@implementation PgMdAtomEntryVisitor
{
@private PgMdAtomEntry __weak *_entry;
}

-(id)init:(NSString*)locale:(PgMdAtomEntry*)entry
{
    self = [super init:locale:entry];
    if(self)
    {
        _entry = entry;
        
    }
    return self;
}



-(void)_processElement:(id<PgMdAtomNode>)child;
{
    [super _processElement:child];
    
    
    PgMdAtomTextAcumulatorVisitor *textAcumulatorVisitor;
    
    
    if([@"published" isEqualToString:[child getNodeName]])
    {
        NSMutableArray *s = [[NSMutableArray alloc]init];
        
        textAcumulatorVisitor = [[PgMdAtomTextAcumulatorVisitor alloc]init:s];
        
        [child accept:textAcumulatorVisitor];
        
        
        NSError *error;
        _entry.published = [_dateParser parseRFC3339:[s componentsJoinedByString:@""] : &error];
        
        return;
        
    }
    
    
    if([@"content" isEqualToString:[child getNodeName]])
    {
        PgMdAtomText *content = [[PgMdAtomText alloc]init];
        content.text = @"";
        content.markup = @"";
        
        
        PgMdAtomTextVisitor *visitor = [[PgMdAtomTextVisitor alloc]init:content];
        
        [child accept:visitor];
        
        
        _entry.content = content;
        
        return;
        
        
        
    }
    
    if([@"summary" isEqualToString:[child getNodeName]])
    {
        PgMdAtomText *summary = [[PgMdAtomText alloc]init];
        summary.text = @"";
        summary.markup = @"";
        
        PgMdAtomTextVisitor *visitor = [[PgMdAtomTextVisitor alloc]init:summary];
        
        [child accept:visitor];
        
        
        _entry.summary = summary;
        
        return;
        
        
    }
    
    if([@"source" isEqualToString:[child getNodeName]])
    {
        PgMdAtomSource *source  = [[PgMdAtomSource alloc]init];
        
        PgMdAtomSourceVisitor *visitor = [[PgMdAtomSourceVisitor alloc]init:_locale:source];
        
        [child accept:visitor];
        
        _entry.source = source;
        
        return;
        
    }
    
}




- (void) dealloc
{
    _dateParser = nil;
}


@end
