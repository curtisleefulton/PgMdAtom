//
//  PgMdAtomNodeVisitorTestImpl.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomNodeVisitorTestImpl.h"

@implementation PgMdAtomNodeVisitorTestImpl
{
@private NSMutableArray *_visits;
}

-(id)init
{
    self = [super init];
    
    if(self)
    {
        _visits = [[NSMutableArray alloc]init];
    }
    
    
    
    return self;
    
}

- (void)visitElement:(id<PgMdAtomNode>)elementNode
{
    [_visits addObject:@"element"];
    
}

- (void)visitElementClose:(id<PgMdAtomNode>)elementNode
{
    [_visits addObject:@"elementClose"];
 
}

- (void)visitAttribute:(id<PgMdAtomNode>)attributeNode
{
    [_visits addObject:@"attribute"];
   
}

- (void)visitText:(id<PgMdAtomNode>)textNode
{
    [_visits addObject:@"text"];

}

-(NSArray*)getVisits
{
    return _visits;
}


-(void) dealloc
{
    [_visits removeAllObjects];
    _visits = nil;
}


@end
