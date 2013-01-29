//
//  PgMdAtomGenerator.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Identifies the software used to generate the feed, for debugging and other purposes.
 */
@interface PgMdAtomGenerator : NSObject

/**
 * optional
 */
@property NSURL *uri;

/**
 * optional
 */
@property NSString *version;

@end
