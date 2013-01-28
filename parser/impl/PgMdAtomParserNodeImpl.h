//
//  PgMdAtomParserNodeImpl.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNode.h"

@interface PgMdAtomParserNodeImpl : NSObject <PgMdAtomNode>


-(void)setNodeName:(NSString*)nodeName;
-(void)setNodeValue:(NSString*)nodeValue;
-(void)addChildNode:(PgMdAtomParserNodeImpl*)childNode;
-(void)addAttributeNode:(PgMdAtomParserNodeImpl*)attributeNode;
-(void)setParentNode:(PgMdAtomParserNodeImpl*)parentNode;
-(PgMdAtomParserNodeImpl*)getParentNode;

@end
