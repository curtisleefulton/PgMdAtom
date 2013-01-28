//
//  PgMdAtomParserElementImpl.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomParserElementImpl.h"
#import "PgMdAtomNodeVisitor.h"

@implementation PgMdAtomParserElementImpl


-(void)accept:(id<PgMdAtomNodeVisitor>)visitor
{
    [super accept:visitor];
    
    [visitor visitElement:self];
    [visitor visitElementClose:self];

    
}


@end
