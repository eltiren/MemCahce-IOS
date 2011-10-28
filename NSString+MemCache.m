//
//  NSString+MemCache.m
//  aid
//
//  Created by Vitaly Evtushenko on 10/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+MemCache.h"
#import "MemCache.h"

@implementation NSString (MemCache)

- (id)memCacheValue
{
    return [[MemCache sharedCache] valueForKey:self];
}

@end
