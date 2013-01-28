//
//  PgMdAtomVNode.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/3/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol PgMdAtomNodeVisitor;

@protocol PgMdAtomNode <NSObject>

-(NSString*)getNodeName;
-(NSString*)getNodeValue;
-(NSArray*)getAttributeNodes;
-(NSArray*)getChildNodes;
-(void)accept:(id<PgMdAtomNodeVisitor>)visitor;

@end
