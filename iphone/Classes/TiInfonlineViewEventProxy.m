/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiInfonlineViewEventProxy.h"
#import "TiUtils.h"

@implementation TiInfonlineViewEventProxy

- (id)_initWithPageContext:(id<TiEvaluator>)context
{
  if (self = [super _initWithPageContext:context]) {
    NSUInteger type = [TiUtils intValue:[self valueForKey:@"type"]];
    NSString *category = [TiUtils stringValue:[self valueForKey:@"category"]];
    NSString *comment = [TiUtils stringValue:[self valueForKey:@"comment"]];

    _event = [[IOLViewEvent alloc] initWithType:type category:category comment:comment];
  }
  
  return self;
}

@end
