//
//  PgMdAtomCoreParser.h
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/4/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PgMdAtomNode.h"

@interface PgMdAtomCoreParser : NSObject <NSXMLParserDelegate>

-(BOOL)parse:(NSData *)xml:(NSError**)error;
-(id<PgMdAtomNode>)getRootElement;

@end
