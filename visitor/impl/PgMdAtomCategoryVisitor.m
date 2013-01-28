//
//  PgMdAtomCategoryVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/30/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomCategoryVisitor.h"

@implementation PgMdAtomCategoryVisitor
{
@private PgMdAtomCategory __weak *_category;
}

-(id)init:(PgMdAtomCategory*)category
{
    self = [super self];
    if(self)
    {
        _category = category;
        
        
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
    
    if([@"scheme" isEqualToString:name] )
    {
        _category.scheme = [NSURL URLWithString:value];
    }
    
    if([@"label" isEqualToString:name] )
    {
        _category.label = value;
        
    }    
    
    if([@"term" isEqualToString:name] )
    {
        _category.term = value;
        
    }
    
}
- (void)visitText:(id<PgMdAtomNode>)textNode
{
    
}




@end
