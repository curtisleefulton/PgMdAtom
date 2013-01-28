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

@interface PgMdAtomEntry : PgMdAtomBase

@property NSDate *published;

@property PgMdAtomText *content;

@property PgMdAtomText *summary;

@property PgMdAtomSource *source;

@end
