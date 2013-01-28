//
//  PgMdAtomSourceVisitor.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomSourceVisitor.h"
#import "PgMdAtomTextAcumulatorVisitor.h"
#import "PgMdAtomGeneratorVisitor.h"
#import "PgMdAtomTextVisitor.h"

@implementation PgMdAtomSourceVisitor
{
@private PgMdAtomSource __weak *_source;
}

-(id)init:(NSString*)locale:(PgMdAtomSource*)source
{
    self = [super init:locale:source];
    
    if(self)
    {
        _source = source;
        
    }
    
    return self;
    
}



-(void)_processElement:(id<PgMdAtomNode>)elementNode
{
    [super _processElement:elementNode];
    
    PgMdAtomTextAcumulatorVisitor *textAcumulatorVisitor;
    
    if([@"subtitle" isEqualToString:[elementNode getNodeName]])
    {
        PgMdAtomText *subTitle  = [[PgMdAtomText alloc]init];
        
        PgMdAtomTextVisitor *visitor = [[PgMdAtomTextVisitor alloc]init:subTitle];
        
        [elementNode accept:visitor];
        
        _source.subTitle = subTitle;
        
        return;
        
        
    }
    
    
    if([@"icon" isEqualToString:[elementNode getNodeName]])
    {
        NSMutableArray *s = [[NSMutableArray alloc]init];
        
        textAcumulatorVisitor = [[PgMdAtomTextAcumulatorVisitor alloc]init:s];
        
        [elementNode accept:textAcumulatorVisitor];
        
        _source.icon = [s componentsJoinedByString:@""];
        
        return;
        
        
    }
    
    if([@"logo" isEqualToString:[elementNode getNodeName]])
    {
        NSMutableArray *s = [[NSMutableArray alloc]init];
        
        textAcumulatorVisitor = [[PgMdAtomTextAcumulatorVisitor alloc]init:s];
        
        [elementNode accept:textAcumulatorVisitor];
        
        _source.logo = [s componentsJoinedByString:@""];
        
        return;
        
    }
    
    
    
    if([@"generator" isEqualToString:[elementNode getNodeName]])
    {
        PgMdAtomGenerator *generator = [[PgMdAtomGenerator alloc]init];
        
        PgMdAtomGeneratorVisitor *visitor = [[PgMdAtomGeneratorVisitor alloc]init:generator];
        
        [elementNode accept:visitor];
        
        _source.generator = generator;
        
        return;
    }
    
    
}




@end
