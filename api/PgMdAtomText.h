//
//  PgMdAtomText.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/11/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Contain human-readable text, usually in small quantities. 
 */
@interface PgMdAtomText : NSObject

/**
 * Determines how PgMdAtomText is encoded (default="text"). If type="text", then this element contains plain text with no entity escaped html. If type="html", then this element contains entity escaped html. If type="xhtml", then this element contains inline xhtml, wrapped in a div element.
 */
@property NSString *type;

/**
 * text representation
 */
@property NSString *text;

/**
 * markup representation
 */
@property NSString *markup;


@end

