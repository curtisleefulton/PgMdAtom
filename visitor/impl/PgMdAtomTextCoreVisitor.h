//
//  PgMdAtomTextVisitor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 1/11/13.
//  Copyright (c) 2013 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNodeVisitor.h"
#import "PgMdAtomText.h"

@interface PgMdAtomTextCoreVisitor : NSObject <PgMdAtomNodeVisitor>


-(id)init:(NSMutableArray*)text:(NSMutableArray*)markup;

@end
