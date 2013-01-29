//
//  PgMdAtomAuthor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/27/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Describe a person, corporation, or similar entity.
 */
@interface PgMdAtomPerson : NSObject

/**
 * conveys a human-readable name for the person. Required.
 */
@property NSString *name;

/**
 * contains an email address for the person
 */
@property NSString *email;

/**
 * contains a home page for the person
 */
@property NSURL *uri;

@end
