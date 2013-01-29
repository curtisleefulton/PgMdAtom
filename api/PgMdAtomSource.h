//
//  PgMdAtomSource.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomBase.h"
#import "PgMdAtomGenerator.h"
#import "PgMdAtomText.h"

/**
 * All feed metadata.
 */
@interface PgMdAtomSource : PgMdAtomBase

/**
 * human-readable description or subtitle for the feed.
 */
@property PgMdAtomText *subTitle;

/**
 * identifies the software used to generate the feed
 */
@property PgMdAtomGenerator *generator;

/**
 * Identifies a small image which provides iconic visual identification for the feed. Icons should be square.
 */
@property NSString *icon;

/**
 * Identifies a larger image which provides visual identification for the feed. Images should be twice as wide as they are tall.
 */
@property NSString *logo;

@end
