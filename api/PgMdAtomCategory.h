//
//  PgMdAtomCategory.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/30/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Atom category model properties.
 */
@interface PgMdAtomCategory : NSObject

/**
 *  identifies the categorization scheme via a URI
 */
@property NSURL *scheme;

/**
 * provides a human-readable label for display
 */
@property NSString *label;

/**
 * required property that identifies the category
 */
@property NSString *term;

@end
