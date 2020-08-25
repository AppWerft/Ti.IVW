/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import <INFOnlineLibrary/INFOnlineLibrary.h>
#import "TiProxy.h"

@interface TiInfonlineEventProxy : TiProxy {
  __kindof IOLEvent *_event;
}

- (__kindof IOLEvent *)event;

@end
