//
//  PgMdAtomFeed.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/3/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomSource.h"

/**
 * Atom feed. A Feed consists of some metadata, followed by any number of entries.
 */
@interface PgMdAtomFeed : PgMdAtomSource

/**
 * feed may have any number of entries
 */
@property NSArray *entries;

@end
