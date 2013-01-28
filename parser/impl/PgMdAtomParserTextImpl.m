//
//  PgMdAtomParserTextImpl.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomParserTextImpl.h"
#import "PgMdAtomNodeVisitor.h"

@implementation PgMdAtomParserTextImpl

-(void)accept:(id<PgMdAtomNodeVisitor>)visitor
{
    [super accept:visitor];
    
    [visitor visitText:self];
    
}

@end
