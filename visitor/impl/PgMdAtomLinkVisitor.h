//
//  PgMdAtomLinkVisitor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/9/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNodeVisitor.h"
#import "PgMdAtomLink.h"

@interface PgMdAtomLinkVisitor : NSObject <PgMdAtomNodeVisitor>

-(id)init:(PgMdAtomLink*)link;

@end
