//
//  PgMdAtomNodeVisitorTestImpl.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/26/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNodeVisitor.h"

@interface PgMdAtomNodeVisitorTestImpl : NSObject <PgMdAtomNodeVisitor>

-(NSArray*)getVisits;

@end
