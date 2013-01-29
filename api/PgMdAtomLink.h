//
//  PgMdAtomLink.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/9/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Identifies a related Web page. Link is patterned after html's link element.
 */
@interface PgMdAtomLink : NSObject

/**
 * the URI of the referenced resource (typically a Web page)
 */
@property NSURL *href;

/**
 * contains a single link relationship type. It can be a full URI or one of the following predefined values (default=alternate):
 * - alternate: an alternate representation of the entry or feed, for example a permalink to the html version of the entry, or the front page of the weblog.
 * - enclosure: a related resource which is potentially large in size and might require special handling, for example an audio or video recording.
 * - related: an document related to the entry or feed.
 * - self: the feed itself.
 * - via: the source of the information provided in the entry.
 */
@property NSString *rel;

/**
 * indicates the media type of the resource
 */
@property NSString *type;

/**
 * indicates the language of the referenced resource.
 */
@property NSString *hreflang;

/**
 * human readable information about the link, typically for display purposes
 */
@property NSString *title;

/**
 * the length of the resource, in bytes
 */
@property int length;


@end
