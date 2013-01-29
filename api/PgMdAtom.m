//
//  PgMdAtom.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/28/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtom.h"

@implementation PgMdAtom

+(id<PgMdAtomParser>)getParser
{
    return [[PgMdAtomParserDefaultImpl alloc]init];
    
}

@end
