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

@interface PgMdAtomSource : PgMdAtomBase

@property PgMdAtomText *subTitle;

@property PgMdAtomGenerator *generator;

@property NSString *icon;

@property NSString *logo;

@end
