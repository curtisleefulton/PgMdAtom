//
//  PgMdAtomNodeVisitorDefaultImpl.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/3/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomSourceVisitor.h"
#import "PgMdAtomFeed.h"

@interface PgMdAtomFeedVisitor : PgMdAtomSourceVisitor


-(id)init:(NSString*)locale:(PgMdAtomFeed*)feed;

@end
