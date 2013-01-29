//
//  PgMdAtomEntry.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/3/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomBase.h"
#import "PgMdAtomText.h"
#import "PgMdAtomSource.h"

/**
 * Atom feed entry.
 */
@interface PgMdAtomEntry : PgMdAtomBase

/**
 * Contains the time of the initial creation or first availability of the entry.
 */
@property NSDate *published;

/**
 * Contains or links to the complete content of the entry. Content must be provided if there is no alternate link, and should be provided if there is no summary.
 */
@property PgMdAtomText *content;

/**
 * Conveys a short summary, abstract, or excerpt of the entry. Summary should be provided if there either is no content provided for the entry, or that content is not inline (i.e., contains a src attribute), or if the content is encoded in base64.
 */
@property PgMdAtomText *summary;

/**
 * If an entry is copied from one feed into another feed, then the source feed's metadata (all child elements of feed other than the entry elements) should be preserved if the source feed contains any of the child elements author, contributor, rights, or category and those child elements are not present in the source entry.
 */
@property PgMdAtomSource *source;

@end
