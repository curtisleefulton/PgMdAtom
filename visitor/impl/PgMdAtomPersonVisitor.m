//
//  PgMdAtomPersonVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomPersonVisitor.h"
#import "PgMdAtomTextAcumulatorVisitor.h"

@implementation PgMdAtomPersonVisitor
{
@private PgMdAtomPerson __weak *_person;
}

-(id)init:(PgMdAtomPerson*)person
{
    self = [super init];
    
    if(self)
    {
        _person = person;
        
    }
    
    return self;
    
}
- (void)visitElement:(id<PgMdAtomNode>)elementNode
{
 
    for(id<PgMdAtomNode> child in [elementNode getChildNodes])
    {
        PgMdAtomTextAcumulatorVisitor *textAcumulatorVisitor;
        
        
        if([@"name" isEqualToString:[child getNodeName]])
        {
            NSMutableArray *s = [[NSMutableArray alloc]init];
            
            textAcumulatorVisitor = [[PgMdAtomTextAcumulatorVisitor alloc]init:s];
            
            [child accept:textAcumulatorVisitor];
            
            _person.name = [s componentsJoinedByString:@""];
        }
        
        if([@"email" isEqualToString:[child getNodeName]])
        {
            NSMutableArray *s = [[NSMutableArray alloc]init];
            
            textAcumulatorVisitor = [[PgMdAtomTextAcumulatorVisitor alloc]init:s];
            
            [child accept:textAcumulatorVisitor];
            
            _person.email = [s componentsJoinedByString:@""];
        }
        
        
        if([@"uri" isEqualToString:[child getNodeName]])
        {
            NSMutableArray *s = [[NSMutableArray alloc]init];
            
            textAcumulatorVisitor = [[PgMdAtomTextAcumulatorVisitor alloc]init:s];
            
            [child accept:textAcumulatorVisitor];
            
            _person.uri = [[NSURL alloc]initWithString:[s componentsJoinedByString:@""]];
        }
    }
    
}

- (void)visitElementClose:(id<PgMdAtomNode>)elementNode
{
    
}

- (void)visitAttribute:(id<PgMdAtomNode>)attributeNode
{
    
}

- (void)visitText:(id<PgMdAtomNode>)textNode
{
    
}

@end
