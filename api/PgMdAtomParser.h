//
//  PgMdAtomParser.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/6/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomFeed.h"

/**
 *  PageMeld Atom feed parser. All Atom feeds must be well-formed XML documents, and are identified with the application/atom+xml media type.
 */
@protocol PgMdAtomParser <NSObject>

/**
 * Parse ATOM feed.
 * @param locale the locale for parsing non-GMT timestamps
 * @param xml the input xml
 * @param error destination reference for writing any parse failure 
 * @return PgMdAtomFeed on success, nil on failure. See error for parse failure details.
 */
-(PgMdAtomFeed*)parse:(NSString*)locale:(NSData *)xml:(NSError**)error;

@end
