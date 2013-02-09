//
//  PgMdAtomTextVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/11/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomTextCoreVisitor.h"

@implementation PgMdAtomTextCoreVisitor
{
@private NSMutableArray __weak *_text;
@private NSMutableArray __weak *_markup;
}

-(id)init:(NSMutableArray*)text:(NSMutableArray*)markup
{
    self = [super init];
    if(self)
    {
        _text = text;
        _markup = markup;
    }
    
    return self;
    
}

- (void)visitElement:(id<PgMdAtomNode>)elementNode
{
    
    
    [_markup addObject:@"<"];
    
    [_markup addObject:[elementNode getNodeName]];
    
    for(id<PgMdAtomNode> attributeNode in [elementNode getAttributeNodes])
    {
        
        [attributeNode accept:self];
    }
    
    [_markup addObject:@">"];
    
    
    
    
    for(id<PgMdAtomNode> childNode in [elementNode getChildNodes])
    {
        
        [childNode accept:self];
    }
}

- (void)visitElementClose:(id<PgMdAtomNode>)elementNode
{
    
    [_markup addObject:@"</"];
    [_markup addObject:[elementNode getNodeName]];
    [_markup addObject:@">"];
    
    
    
}

- (void)visitAttribute:(id<PgMdAtomNode>)attributeNode
{
  
    
    [_markup addObject:@" "];
    
    [_markup addObject:[attributeNode getNodeName]];
    
    [_markup addObject:@"=\""];
    
    [_markup addObject:[attributeNode getNodeValue]];
    
    [_markup addObject:@"\""];
    
}

- (void)visitText:(id<PgMdAtomNode>)textNode
{
    [_text addObject:[textNode getNodeValue]];
    [_markup addObject:[textNode getNodeValue]];    
}


- (void)visitCData:(id <PgMdAtomNode>)cdataNode
{
    [_text addObject:[cdataNode getNodeValue]];
    [_markup addObject:@"<![CDATA["];
    [_markup addObject:[cdataNode getNodeValue]];
    [_markup addObject:@"]]>"];
}


@end
