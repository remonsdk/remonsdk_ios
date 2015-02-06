//
//  RemonURLConnection.h
//  remon
//
//  Created by Rabbit on 2013. 11. 1..
//  Copyright (c) 2013년 DNA Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemonAdContentData.h"

@class ADResult;

@protocol RemonConnectionDelegate ;

@interface RemonURLConnection : NSObject <NSURLConnectionDelegate>

@property (nonatomic, assign) int tag;
@property (nonatomic, assign) float timeout;
@property (nonatomic, assign) BOOL logMode;

- (void) getRequest:(NSString *) url delegate:(id<RemonConnectionDelegate>)delegate ;
- (void) poetRequest:(NSString *) url delegate:(id<RemonConnectionDelegate>)delegate postBody:(NSArray *)postBody;
- (void) cancel;
//- (void) requestImage:(NSString *) url delegate:(id<RemonConnectionDelegate>)delegate;

@end

@protocol RemonConnectionDelegate <NSObject>

@optional
- (void) error:(RemonURLConnection *)connection error:(NSError *)error;
- (void) success:(RemonURLConnection *)connection result:(NSObject *)result;

@end