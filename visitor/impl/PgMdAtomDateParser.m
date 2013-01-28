//
//  PgMdAtomDateParser.m
//  PageMeld Atom Parser
//
//  Created by Curtis Fulton on 12/5/12.
//  Copyright (c) 2012 Curtis Fulton. All rights reserved.
//

#import "PgMdAtomDateParser.h"

@implementation PgMdAtomDateParser
{
@private NSDateFormatter *_rfc3339TimestampFormatterWithTimeZone;
@private NSString __weak *_locale;
}

-(id)init:(NSString*)locale
{
    self = [super init];
    if(self)
    {
        _locale = locale;
        _rfc3339TimestampFormatterWithTimeZone = [[NSDateFormatter alloc] init];
        [_rfc3339TimestampFormatterWithTimeZone setLocale:[[NSLocale alloc] initWithLocaleIdentifier:locale]];
        
        [_rfc3339TimestampFormatterWithTimeZone setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        
    }
    return self;
}

- (NSDate *)parseRFC3339:(NSString *)dateString:(NSError**)error
{
    
    NSDate *theDate = nil;
    if([_rfc3339TimestampFormatterWithTimeZone getObjectValue:&theDate forString:dateString range:nil error:error])
        return theDate;
    else
        return nil;
}



- (void) dealloc
{
    _rfc3339TimestampFormatterWithTimeZone = nil;
}

@end
