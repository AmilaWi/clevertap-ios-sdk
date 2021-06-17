//
//  Header.h
//  CleverTapSDK
//
//  Created by Akash Malhotra on 16/06/21.
//  Copyright © 2021 CleverTap. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CleverTapURLDelegate <NSObject>

/*!
 @method
 
 @abstract
 Implement custom handling of URLs.
 
 @discussion
 Use this method if you would like to implement custom handling for URLs in case of in-app notification CTAs, push notifications and App inbox.
 
 Use the following enum values of type CleverTapFeature to optionally implement URL handling based on the corresponding CleverTap feature.
 
 CleverTapPush - Remote Notifications,
 CleverTapAppInbox - App Inbox,
 CleverTapInAppNotification - In-App Notifications
 
 @param url                     the NSURL object
 @param feature                 the CleverTapFeature enum value
 */
- (BOOL)shouldHandleURL: (NSURL* _Nullable )url forFeature: (CleverTapFeature)feature;

@end
