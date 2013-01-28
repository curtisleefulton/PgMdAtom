//
//  PgMdAtomAtomBaseVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomBaseVisitor.h"
#import "PgMdAtomTextAcumulatorVisitor.h"
#import "PgMdAtomCategoryVisitor.h"
#import "PgMdAtomLinkVisitor.h"
#import "PgMdAtomPersonVisitor.h"
#import "PgMdAtomTextVisitor.h"

@implementation PgMdAtomBaseVisitor
{
@private PgMdAtomBase *_atomBase;
    
}
-(id)init:(NSString*)locale:(PgMdAtomBase*)atomBase
{
    self = [super self];
    
    if(self)
    {
        _atomBase = atomBase;
        _dateParser = [[PgMdAtomDateParser alloc]init:locale];
    }
    
    return self;
}

- (void)visitElement:(id<PgMdAtomNode>)elementNode
{
    NSMutableArray *categories = [[NSMutableArray alloc]init];
    NSMutableArray *contributors = [[NSMutableArray alloc]init];
    NSMutableArray *links = [[NSMutableArray alloc]init];


    for(id<PgMdAtomNode> child in [elementNode getChildNodes])
    {
        PgMdAtomTextAcumulatorVisitor *textAcumulatorVisitor;
        
        
        if([@"id" isEqualToString:[child getNodeName]])
        {
            NSMutableArray *s = [[NSMutableArray alloc]init];
            
            textAcumulatorVisitor = [[PgMdAtomTextAcumulatorVisitor alloc]init:s];
            
            [child accept:textAcumulatorVisitor];
            
            
            _atomBase.atomId = [[NSURL alloc]initWithString:[s componentsJoinedByString:@""]];
            
            continue;
        }
        
        if([@"author" isEqualToString:[child getNodeName]])
        {
            PgMdAtomPerson *author = [[PgMdAtomPerson alloc]init];
            
            PgMdAtomPersonVisitor *visitor = [[PgMdAtomPersonVisitor alloc]init:author];
            
            [child accept:visitor];
            
            _atomBase.author = author;
            
            continue;
        }
        
        if([@"category" isEqualToString:[child getNodeName]])
        {
            PgMdAtomCategory *category  = [[PgMdAtomCategory alloc]init];
            
            PgMdAtomCategoryVisitor *visitor = [[PgMdAtomCategoryVisitor alloc]init:category];
            
            [child accept:visitor];
            
            [categories addObject:category];
            
            continue;

            
            
        }
        
        
        if([@"contributor" isEqualToString:[child getNodeName]])
        {
            PgMdAtomText *contributor = [[PgMdAtomText alloc]init];
            
            PgMdAtomTextVisitor *visitor = [[PgMdAtomTextVisitor alloc]init:contributor];
            
            [child accept:visitor];
            
            [contributors addObject:contributor];
            
            continue;

            
        }
        
        
        if([@"link" isEqualToString:[child getNodeName]])
        {
            PgMdAtomLink *link = [[PgMdAtomLink alloc]init];
            
            PgMdAtomLinkVisitor *visitor = [[PgMdAtomLinkVisitor alloc]init:link];
            
            [child accept:visitor];
            
            
            [links addObject:link];
            
            continue;

            
        }
        
        
        if([@"rights" isEqualToString:[child getNodeName]])
        {
            PgMdAtomText *rights  = [[PgMdAtomText alloc]init];
            
            PgMdAtomTextVisitor *visitor = [[PgMdAtomTextVisitor alloc]init:rights];
            
            [child accept:visitor];
            
            _atomBase.rights = rights;
            
            continue;

            
        }
        
        
        if([@"title" isEqualToString:[child getNodeName]])
        {
            PgMdAtomText *title  = [[PgMdAtomText alloc]init];
            
            PgMdAtomTextVisitor *visitor = [[PgMdAtomTextVisitor alloc]init:title];
            
            [child accept:visitor];
            
            _atomBase.title = title;
            
            continue;

            
        }
        
        
        if([@"updated" isEqualToString:[child getNodeName]])
        {
            NSMutableArray *s = [[NSMutableArray alloc]init];
            
            textAcumulatorVisitor = [[PgMdAtomTextAcumulatorVisitor alloc]init:s];
            
            [child accept:textAcumulatorVisitor];
            
            
            NSError *error;
            _atomBase.updated = [_dateParser parseRFC3339:[s componentsJoinedByString:@""] : &error];
            
            continue;

            
        }
        
        [self _processElement:child];

    }
    
    _atomBase.categories = categories;
    _atomBase.contributors = contributors;
    _atomBase.links = links;
    
    
}

-(void)_processElement:(id<PgMdAtomNode>)elementNode
{
    
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


- (void) dealloc
{
    _dateParser = nil;
}



@end
