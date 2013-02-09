//
//  PgMdAtomVNodeVisitor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/3/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNode.h"

@protocol PgMdAtomNodeVisitor <NSObject>

- (void)visitElement:(id<PgMdAtomNode>)elementNode;
- (void)visitElementClose:(id<PgMdAtomNode>)elementNode;
- (void)visitAttribute:(id<PgMdAtomNode>)attributeNode;
- (void)visitText:(id<PgMdAtomNode>)textNode;
- (void)visitCData:(id<PgMdAtomNode>)textNode;



@end
