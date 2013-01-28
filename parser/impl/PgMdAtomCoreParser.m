//
//  PgMdAtomCoreParser.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomCoreParser.h"
#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomParserAttributeImpl.h"
#import "PgMdAtomParserTextImpl.h"
#import "PgMdAtomParserElementImpl.h"

@implementation PgMdAtomCoreParser
{
    
@private PgMdAtomParserNodeImpl *_currentElement;
@private PgMdAtomParserNodeImpl *_rootElement;

    
}


-(BOOL)parse:(NSData *)xml:(NSError**)error
{
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:xml];
    nsXmlParser.delegate = self;
    BOOL success = [nsXmlParser parse];
    
    if(!success)
        *error = [nsXmlParser parserError];
    
    nsXmlParser.delegate = nil;
    return success;
    
}




- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    PgMdAtomParserNodeImpl *grandParent = _currentElement;
    
  
    
    _currentElement = [[PgMdAtomParserElementImpl alloc]init];
    
    if(_rootElement == nil)
    {
        _rootElement = _currentElement;
    }
    
    [_currentElement setNodeName:elementName];
    
    if(grandParent != nil)
    {
        [grandParent addChildNode:_currentElement];
        
    }
    
    for(id name in attributeDict)
    {
        NSString *value = [attributeDict objectForKey:name];
        PgMdAtomParserAttributeImpl *parserAttribute = [[PgMdAtomParserAttributeImpl alloc]init];
        [parserAttribute setNodeName:name];
        [parserAttribute setNodeValue:value];
        [_currentElement addAttributeNode:parserAttribute];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    

    if([_currentElement getParentNode] != nil)
    {

        _currentElement = [_currentElement getParentNode];
    }
    
    

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{    
    PgMdAtomParserTextImpl *textNode = [[PgMdAtomParserTextImpl alloc]init];
    [textNode setNodeValue:string];
    [_currentElement addChildNode:textNode];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    
}

-(id<PgMdAtomNode>)getRootElement
{
   
    return _rootElement;
}

- (void) dealloc
{
    _currentElement = nil;
    _rootElement = nil;
}

@end
