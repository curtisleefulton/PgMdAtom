//
//  PgMdAtomPersonVisitor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNodeVisitor.h"
#import "PgMdAtomPerson.h"

@interface PgMdAtomPersonVisitor : NSObject <PgMdAtomNodeVisitor>

-(id)init:(PgMdAtomPerson*)person;

@end
