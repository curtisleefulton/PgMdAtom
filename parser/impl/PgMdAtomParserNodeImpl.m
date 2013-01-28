//
//  PgMdAtomParserNodeImpl.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomParserNodeImpl.h"

@implementation PgMdAtomParserNodeImpl
{
@private NSString *_nodeName;
@private NSString *_nodeValue;
@private NSMutableArray *_attributeNodes;
@private NSMutableArray *_childNodes;
@private PgMdAtomParserNodeImpl __weak *_parentNode;

}

-(id)init
{
    self = [super init];
    
    if(self)
    {
        _childNodes = [[NSMutableArray alloc]init];
        _attributeNodes = [[NSMutableArray alloc]init];

    }
    
    return self;
}

-(void)setParentNode:(PgMdAtomParserNodeImpl*)parentNode
{
    _parentNode = parentNode;
    
}

-(PgMdAtomParserNodeImpl*)getParentNode
{
    return _parentNode;
    
}

-(NSString*)getNodeName
{
   
    return _nodeName;
    
}

-(NSString*)getNodeValue
{
    return _nodeValue;
    
}

-(NSArray*)getAttributeNodes
{
    return _attributeNodes;
    
       
    
}

-(NSArray*)getChildNodes
{
    
    return _childNodes;
    
       

    
}

-(void)accept:(id<PgMdAtomNodeVisitor>)visitor
{
    
}

-(void)setNodeName:(NSString*)nodeName
{
       _nodeName = nodeName;
    
}

-(void)setNodeValue:(NSString*)nodeValue
{
    _nodeValue = nodeValue;
    
}

-(void)addChildNode:(PgMdAtomParserNodeImpl*)childNode
{
    
    [childNode setParentNode:self];
    

    [_childNodes addObject:childNode];
   
}

-(void)addAttributeNode:(PgMdAtomParserNodeImpl*)attributeNode
{
    [attributeNode setParentNode:self];

    

    [_attributeNodes addObject:attributeNode];
}




- (void) dealloc
{

    _nodeName = nil;
    _nodeValue = nil;
    
    [_attributeNodes removeAllObjects];  
    [_childNodes removeAllObjects];
    
    _attributeNodes = nil;
    _childNodes = nil;
}

@end
