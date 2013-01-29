SYNOPSIS

docs at https://pagemeld.com/PgMdAtom

```
#import "PgMdAtom.h"

id<PgMdAtomParser> atomParser = [PgMdAtom getParser];

NSString *locale = @"en_US";
NSData *xml = [@"<feed/>" dataUsingEncoding:NSUTF8StringEncoding];
NSError *error;

PgMdAtomFeed *feed = [atomParser parse:locale:xml:&error];
```
