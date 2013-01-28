//
//  PgMdAtomParser.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/6/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomFeed.h"

@protocol PgMdAtomParser <NSObject>

-(PgMdAtomFeed*)parse:(NSString*)locale:(NSData *)xml:(NSError**)error;

@end
