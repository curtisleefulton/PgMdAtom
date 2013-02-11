//
//  PgMdAtomVisitor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomBaseVisitor.h"
#import "PgMdAtomNodeVisitor.h"
#import "PgMdAtomEntry.h"

@interface PgMdAtomEntryVisitor : PgMdAtomBaseVisitor <PgMdAtomNodeVisitor>



-(id)init:(NSString*)locale:(PgMdAtomEntry*)entry;

@end
