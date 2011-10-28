//
//  NSObject+MemCache.m
//  aid
//
//  Created by Vitaly Evtushenko on 10/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSObject+MemCache.h"
#import "MemCache.h"

@implementation NSObject (MemCache)

- (void)setMemCacheValueForKey:(NSString*)key
{
    [[MemCache sharedCache] setValue:self forKey:key];
}

@end
