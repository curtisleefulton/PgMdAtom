//
//  PgMdAtomDateParser.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/5/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PgMdAtomDateParser : NSObject

-(id)init:(NSString*)locale;
- (NSDate *)parseRFC3339:(NSString *)dateString:(NSError**)error;

@end
