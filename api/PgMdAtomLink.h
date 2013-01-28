//
//  PgMdAtomLink.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/9/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PgMdAtomLink : NSObject

@property NSURL *href;
@property NSString *rel;
@property NSString *type;
@property NSString *hreflang;
@property NSString *title;
@property int length;


@end
