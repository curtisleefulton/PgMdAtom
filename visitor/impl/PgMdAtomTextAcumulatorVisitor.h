//
//  PgMdAtomTextAcumulatorVisitor.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNodeVisitor.h"

@interface PgMdAtomTextAcumulatorVisitor : NSObject <PgMdAtomNodeVisitor>


-(id)init:(NSMutableArray*)text;

@end
