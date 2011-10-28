//
//  ELCache.h
//  aid
//
//  Created by Vitaly Evtushenko on 10/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemCache : NSObject
{
    @private    
    NSMutableDictionary *_cache;
    float _lifeTime;
}

@property (nonatomic,assign) float lifeTime;

+ (MemCache*)sharedCache;

- (void)setValue:(id)value forKey:(NSString*)key;
- (id)valueForKey:(NSString*)key;
- (void)clearCache;

@end
