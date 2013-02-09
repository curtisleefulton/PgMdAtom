//
// Created by curtis.fulton on 2/9/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PgMdAtomParserCDataImpl.h"
#import "PgMdAtomNodeVisitor.h"

@implementation PgMdAtomParserCDataImpl


- (void)accept:(id <PgMdAtomNodeVisitor>)visitor
{
    [super accept:visitor];
    [visitor visitCData:self];

}


@end