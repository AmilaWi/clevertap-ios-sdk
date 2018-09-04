//
//  NotificationService.swift
//  NotificationService
//
//  Created by Aditi on 6/27/18.
//  Copyright © 2018 Aditi Agrawal. All rights reserved.
//

import CTNotificationService
import CleverTapSDK

class NotificationService: CTNotificationServiceExtension {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        CleverTap.setDebugLevel(CleverTapLogLevel.debug.rawValue)
        // While running the Application add CleverTap Account ID and Account token in your .plist file
        CleverTap.autoIntegrate()
        CleverTap.sharedInstance()?.recordEvent("testEventFromAppex")
        super.didReceive(request, withContentHandler: contentHandler)
    }
}
