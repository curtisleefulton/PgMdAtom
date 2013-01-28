//
//  PgMdAtomAtomBaseVisitor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNodeVisitor.h"
#import "PgMdAtomBase.h"
#import "PgMdAtomDateParser.h"

@interface PgMdAtomBaseVisitor : NSObject <PgMdAtomNodeVisitor>
{
@protected NSString __weak *_locale;
@protected PgMdAtomDateParser *_dateParser;
}
-(id)init:(NSString*)locale:(PgMdAtomBase*)atomBase;

-(void)_processElement:(id<PgMdAtomNode>)elementNode;

@end
