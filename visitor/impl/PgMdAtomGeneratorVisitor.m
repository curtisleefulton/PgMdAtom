//
//  PgMdAtomGeneratorVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomGeneratorVisitor.h"

@implementation PgMdAtomGeneratorVisitor
{
@private PgMdAtomGenerator __weak *_generator;
}

-(id)init:(PgMdAtomGenerator*)generator
{
    self = [super init];
    
    if(self)
    {
        _generator = generator;
        
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
    
    if([@"uri" isEqualToString:name] )
    {
        _generator.uri = [NSURL URLWithString:value];
    }

    if([@"version" isEqualToString:name] )
    {
        _generator.version = value;
    }

    
}

- (void)visitText:(id<PgMdAtomNode>)textNode
{
    
}


@end
