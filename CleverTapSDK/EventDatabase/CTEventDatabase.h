//
//  CTEventDatabase.h
//  CleverTapSDK
//
//  Created by Nishant Kumar on 25/10/24.
//  Copyright © 2024 CleverTap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "CleverTapEventDetail.h"
#import "CTClock.h"

@interface CTEventDatabase : NSObject

+ (instancetype)sharedInstance;
- (instancetype)initWithClock:(id <CTClock>)clock;

- (NSInteger)databaseVersion;

- (BOOL)insertEvent:(NSString *)eventName
normalizedEventName:(NSString *)normalizedEventName
           deviceID:(NSString *)deviceID;

- (BOOL)updateEvent:(NSString *)normalizedEventName
        forDeviceID:(NSString *)deviceID;

- (BOOL)upsertEvent:(NSString *)eventName
normalizedEventName:(NSString *)normalizedEventName
           deviceID:(NSString *)deviceID;

- (BOOL)eventExists:(NSString *)normalizedEventName
        forDeviceID:(NSString *)deviceID;

- (NSInteger)getEventCount:(NSString *)normalizedEventName
                  deviceID:(NSString *)deviceID;

- (NSInteger)getFirstTimestamp:(NSString *)normalizedEventName
                      deviceID:(NSString *)deviceID;

- (NSInteger)getLastTimestamp:(NSString *)normalizedEventName
                     deviceID:(NSString *)deviceID;

- (CleverTapEventDetail *)getEventDetail:(NSString *)normalizedEventName
                                deviceID:(NSString *)deviceID;

- (NSArray<CleverTapEventDetail *> *)getAllEventsForDeviceID:(NSString *)deviceID;

- (BOOL)deleteAllRows;

- (BOOL)deleteLeastRecentlyUsedRows:(NSInteger)maxRowLimit
              numberOfRowsToCleanup:(NSInteger)numberOfRowsToCleanup;

@end
