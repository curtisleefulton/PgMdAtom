//
//  PgMdAtomBase.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomPerson.h"
#import "PgMdAtomText.h"

/**
 * Atom model properties shared by feeds and entries.
 */
@interface PgMdAtomBase : NSObject

/**
 * Identifies the feed or entry using a universally unique and permanent URI. Two entries in a feed can have the same value for id if they represent the same entry at different points in time.
 */
@property NSURL *atomId;

/**
 * Names one author of the feed or entry. A feed or entry may have multiple author elements. A feed must contain at least one author element unless all of the entry elements contain at least one author element. An entry must contain at least one author element unless there is an author element in the enclosing feed, or there is an author element in the enclosed source element.
 */
@property PgMdAtomPerson *author;

/**
 * Specifies a category that the feed or entry belong to. A feed or entry may have multiple category elements. 
 */
@property NSArray *categories;

/**
 * Names one contributor to the feed or entry. A feed or entry may have multiple contributor elements. 
 */
@property NSArray *contributors;

/**
 * Identifies a related Web page for feeds and entries. A feed or entry is limited to one alternate per type and hreflang. A feed should contain a link back to the feed itself. An entry must contain an alternate link if there is no content element.
 */
@property NSArray *links;

/**
 * Conveys information about rights, e.g. copyrights, held in and over the feed or entry. 
 */
@property PgMdAtomText *rights;

/**
 * Contains a human readable title for the feed or entry. For feeds, often the same as the title of the associated website. This value should not be blank.
 */
@property PgMdAtomText *title;

/**
 * Indicates the last time the feed or entry was modified in a significant way. This value need not change after a typo is fixed, only after a substantial modification. Generally, different entries in a feed will have different updated timestamps.
 */
@property NSDate *updated;

@end
