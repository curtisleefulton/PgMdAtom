SYNOPSIS

#import "PgMdAtomParserDefaultImpl.h"

id<PgMdAtomParser> atomParser = [[PgMdAtomParserDefaultImpl alloc]init];

NSString *locale = @"en_US";
NSData *xml = [@"<feed/>" dataUsingEncoding:NSUTF8StringEncoding];
NSError *error;

PgMdAtomFeed *feed = [atomParser parse:locale:xml:&error];
