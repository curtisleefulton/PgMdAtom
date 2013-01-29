//
//  PgMdAtom.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/28/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomParserDefaultImpl.h"

/**
 *  PageMeld default Atom parser factory. Atom is the name of an XML-based Web content and metadata syndication format, and an application-level protocol for publishing and editing Web resources belonging to periodically updated websites.
 */
@interface PgMdAtom : NSObject

/**
 * Factory accessor
 * @return default PgMdAtomParser
 */
+(id<PgMdAtomParser>)getParser;

@end
