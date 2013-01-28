//
//  PgMdAtomSourceVisitor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomSource.h"
#import "PgMdAtomNodeVisitor.h"
#import "PgMdAtomBaseVisitor.h"

@interface PgMdAtomSourceVisitor : PgMdAtomBaseVisitor <PgMdAtomNodeVisitor>

-(id)init:(NSString*)locale:(PgMdAtomSource*)source;

@end
