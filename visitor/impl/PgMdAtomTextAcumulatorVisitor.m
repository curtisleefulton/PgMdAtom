//
//  PgMdAtomTextAcumulatorVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomTextAcumulatorVisitor.h"

@implementation PgMdAtomTextAcumulatorVisitor
{
@private NSMutableArray __weak *_text;
}

-(id)init:(NSMutableArray*)text
{
    self = [super init];
    if(self)
    {
        _text = text;
        
    }
    return self;
}

- (void)visitElement:(id<PgMdAtomNode>)elementNode
{
    

    for(id<PgMdAtomNode> childNode in [elementNode getChildNodes])
    {

        [childNode accept:self];
    }

    
}

- (void)visitElementClose:(id<PgMdAtomNode>)elementNode
{
    
}

- (void)visitAttribute:(id<PgMdAtomNode>)attributeNode
{
    
}
- (void)visitText:(id<PgMdAtomNode>)textNode
{

    [_text addObject:[textNode getNodeValue]];
}




@end
