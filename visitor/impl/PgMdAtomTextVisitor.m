//
//  PgMdAtomTextTypeVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomTextVisitor.h"
#import "PgMdAtomTextCoreVisitor.h"

@implementation PgMdAtomTextVisitor
{
@private PgMdAtomText __weak *_atomText;
@private PgMdAtomTextCoreVisitor *_textCoreVisitor;
@private NSMutableArray *_text;
@private NSMutableArray *_markup;
}

-(id)init:(PgMdAtomText*)atomText
{
    self = [super init];
    
    
    if(self)
    {
        _atomText = atomText;
        _text = [NSMutableArray array];
        _markup = [NSMutableArray array];
        _textCoreVisitor = [[PgMdAtomTextCoreVisitor alloc]init:_text:_markup];
    }
    
    
    return self;
    
}

- (void)visitElement:(id<PgMdAtomNode>)elementNode
{
    [_textCoreVisitor visitElement:elementNode];
    
    for(id<PgMdAtomNode> attributeNode in [elementNode getAttributeNodes])
    {
        
        [attributeNode accept:self];
    }
    
    
}

- (void)visitElementClose:(id<PgMdAtomNode>)elementNode
{
    [_textCoreVisitor visitElementClose:elementNode];
    
    _atomText.text = [_text componentsJoinedByString:@""];   
    _atomText.markup = [_markup componentsJoinedByString:@""];    
}

- (void)visitAttribute:(id<PgMdAtomNode>)attributeNode
{
    if([@"type" isEqualToString:[attributeNode getNodeName]])
    {
        _atomText.type = [attributeNode getNodeValue];
    }
    
    
}

- (void)visitText:(id<PgMdAtomNode>)textNode
{
    
}

- (void)visitCData:(id <PgMdAtomNode>)cdataNode
{

}

- (void) dealloc
{
    _textCoreVisitor = nil;
    [_text removeAllObjects];
    [_markup removeAllObjects];
    _text = nil;
    _markup = nil;
}

@end
