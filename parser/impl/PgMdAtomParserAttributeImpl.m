//
//  PgMdAtomParserAttributeImpl.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomParserAttributeImpl.h"
#import "PgMdAtomNodeVisitor.h"

@implementation PgMdAtomParserAttributeImpl

-(void)accept:(id<PgMdAtomNodeVisitor>)visitor
{
    [super accept:visitor];
    
    [visitor visitAttribute:self];
    
}

@end
