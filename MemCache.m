//
//  ELCache.m
//  aid
//
//  Created by Vitaly Evtushenko on 10/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MemCache.h"

static MemCache *sharedCache = nil;

@implementation MemCache

@synthesize lifeTime = _lifeTime;

+ (MemCache*)sharedCache
{
	if(!sharedCache)
	{
		sharedCache = [[MemCache alloc] init];
	}
	
	return sharedCache;
}


- (id) init
{
	self = [super init];
	if (self != nil) 
	{        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(clearCache)
                       name:UIApplicationDidReceiveMemoryWarningNotification
                     object:nil];
        [center addObserver:self
                   selector:@selector(clearCache)
                       name:UIApplicationWillResignActiveNotification
                     object:nil];
        _lifeTime = 60.0f;
	}
	return self;
}

- (void)clearCache
{
    [_cache removeObjectsForKeys:[_cache allKeys]];
    _cache = nil;
}

- (void)dealloc
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if (!_cache)
    {
        _cache = [[NSMutableDictionary alloc] init];
    }
    
    [_cache setValue:value forKey:key];
    [NSObject cancelPreviousPerformRequestsWithTarget:_cache selector:@selector(removeObjectForKey:) object:key];
    [_cache performSelector:@selector(removeObjectForKey:) withObject:key afterDelay:_lifeTime];
}

- (id)valueForKey:(NSString *)key
{
    return [_cache valueForKey:key];
}

@end