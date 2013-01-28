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

@interface PgMdAtomBase : NSObject

@property NSURL *atomId;

@property PgMdAtomPerson *author;

@property NSArray *categories;

@property NSArray *contributors;

@property NSArray *links;

@property PgMdAtomText *rights;

@property PgMdAtomText *title;

@property NSDate *updated;

@end
