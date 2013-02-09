//
//  PgMdAtomLinkVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/9/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomLinkVisitor.h"

@implementation PgMdAtomLinkVisitor
{
@private PgMdAtomLink __weak *_link;
}

-(id)init:(PgMdAtomLink*)link
{
    self = [super init];
    if(self)
    {
        _link = link;
        
    }
    return self;
}

- (void)visitElement:(id<PgMdAtomNode>)elementNode
{
    
    for(id<PgMdAtomNode> attributeNode in [elementNode getAttributeNodes])
    {
        
        [attributeNode accept:self];
    }

    
    
}

- (void)visitElementClose:(id<PgMdAtomNode>)elementNode
{
    
}

- (void)visitAttribute:(id<PgMdAtomNode>)attributeNode
{
    NSString *name = [attributeNode getNodeName];
    NSString *value = [attributeNode getNodeValue];
    
    if([@"href" isEqualToString:name] )
    {
        _link.href = [NSURL URLWithString:value];
        
    }
    
    if([@"rel" isEqualToString:name] )
    {
        _link.rel = value;
        
    }

    
    if([@"type" isEqualToString:name] )
    {
        _link.type = value;
        
    }

    
    if([@"hreflang" isEqualToString:name] )
    {
        _link.hreflang = value;
        
    }

    
    if([@"title" isEqualToString:name] )
    {
        _link.title = value;
        
    }

    
    if([@"length" isEqualToString:name] )
    {
        _link.length = [value intValue];
        
    }

    
}
- (void)visitText:(id<PgMdAtomNode>)textNode
{
    
}

- (void)visitCData:(id <PgMdAtomNode>)cdataNode
{

}


@end
