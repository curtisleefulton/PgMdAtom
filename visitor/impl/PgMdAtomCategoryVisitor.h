//
//  PgMdAtomCategoryVisitor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/30/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNodeVisitor.h"
#import "PgMdAtomCategory.h"

@interface PgMdAtomCategoryVisitor : NSObject <PgMdAtomNodeVisitor>

-(id)init:(PgMdAtomCategory*)category;
@end
